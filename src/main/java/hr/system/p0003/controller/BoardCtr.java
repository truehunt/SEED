package hr.system.p0003.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hr.system.p0003.service.BoardSvc;
import hr.system.p0003.vo.BoardGroupVO;
import hr.system.p0003.vo.BoardReplyVO;
import hr.system.p0003.vo.BoardSearchVO;
import hr.system.p0003.vo.BoardVO;
import project.common.Field3VO;
import project.common.FileUtil;
import project.common.FileVO;
import project.common.TreeMaker;
import project.common.UtilEtc;
import project.common.EtcSvc;

@Controller 
public class BoardCtr {

    @Autowired
    private BoardSvc boardSvc;
    
    @Autowired
    private EtcSvc etcSvc;    
    
    static final Logger LOGGER = LoggerFactory.getLogger(BoardCtr.class);
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/boardList")
    public String boardList(HttpServletRequest request, BoardSearchVO searchVO, ModelMap modelMap) {
        String globalKeyword = request.getParameter("globalKeyword");  // it's search from left side bar
        if (globalKeyword!=null & !"".equals(globalKeyword)) {
            searchVO.setSearchKeyword(globalKeyword);
        }        
        
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        // etcSvc.setCommonAttribute(userno, modelMap);
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        
        if (searchVO.getBgno() != null && !"".equals(searchVO.getBgno())) {
            BoardGroupVO bgInfo = boardSvc.selectBoardGroupOne4Used(searchVO.getBgno());
            if (bgInfo == null) { 
                return "system/p0003/BoardGroupFail";
            }
            modelMap.addAttribute("bgInfo", bgInfo);
        }
        
        List<?> noticelist  = boardSvc.selectNoticeList(searchVO);

        searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow
        List<?> listview  = boardSvc.selectBoardList(searchVO);
        
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("noticelist", noticelist);
        
        if (searchVO.getBgno() == null || "".equals(searchVO.getBgno())) {
            return "system/p0003/BoardListAll";
        }
        return "system/p0003/BoardList";
    }
    
    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/boardForm")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        // etcSvc.setCommonAttribute(userno, modelMap);
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        
        String bgno = request.getParameter("bgno");
        String brdno = request.getParameter("brdno");
        
        if (brdno != null) {
            BoardVO boardInfo = boardSvc.selectBoardOne(new Field3VO(brdno, userno, null));
            List<?> listview = boardSvc.selectBoardFileList(brdno);
        
            modelMap.addAttribute("boardInfo", boardInfo);
            modelMap.addAttribute("listview", listview);
            bgno = boardInfo.getBgno();
        }
        BoardGroupVO bgInfo = boardSvc.selectBoardGroupOne4Used(bgno);
        if (bgInfo == null) {
            return "system/p0003/BoardGroupFail";
        }
        
        modelMap.addAttribute("bgno", bgno);
        modelMap.addAttribute("bgInfo", bgInfo);
        
        return "system/p0003/BoardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/boardSave")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        boardInfo.setFK_SAWON_CODE(userno);

        if (boardInfo.getBrdno() != null && !"".equals(boardInfo.getBrdno())) {    // check auth for update
            String chk = boardSvc.selectBoardAuthChk(boardInfo);
            if (chk == null) {
                return "common/noAuth";
            }
        }
        
        String[] fileno = request.getParameterValues("fileno");
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile());

        boardSvc.insertBoard(boardInfo, filelist, fileno);

        return "redirect:/boardList?bgno=" + boardInfo.getBgno();
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/boardRead")
    public String boardRead(HttpServletRequest request, ModelMap modelMap) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        // etcSvc.setCommonAttribute(userno, modelMap);
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        
        String bgno = request.getParameter("bgno");
        String brdno = request.getParameter("brdno");
        
        Field3VO f3 = new Field3VO(brdno, userno, null);
        
        boardSvc.updateBoardRead(f3);
        BoardVO boardInfo = boardSvc.selectBoardOne(f3);
        List<?> listview = boardSvc.selectBoardFileList(brdno);
        List<?> replylist = boardSvc.selectBoardReplyList(brdno);

        BoardGroupVO bgInfo = boardSvc.selectBoardGroupOne4Used(boardInfo.getBgno());
        if (bgInfo == null) {
            return "system/p0003/BoardGroupFail";
        }
        
        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("replylist", replylist);
        modelMap.addAttribute("bgno", bgno);
        modelMap.addAttribute("bgInfo", bgInfo);
        
        return "system/p0003/BoardRead";
    }
    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/boardDelete")
    public String boardDelete(HttpServletRequest request) {
        String brdno = request.getParameter("brdno");
        String bgno = request.getParameter("bgno");
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();

        BoardVO boardInfo = new BoardVO();        // check auth for delete
        boardInfo.setBrdno(brdno);
        boardInfo.setFK_SAWON_CODE(userno);
        String chk = boardSvc.selectBoardAuthChk(boardInfo);
        if (chk == null) {
            return "common/noAuth";
        }
        
        boardSvc.deleteBoardOne(brdno);
        
        return "redirect:/boardList?bgno=" + bgno;
    }

    /**
     * 게시판 트리. Ajax용.     
     */
    @RequestMapping(value = "/boardListByAjax")
       public void boardListByAjax(HttpServletResponse response, ModelMap modelMap) {
        List<?> listview = boardSvc.selectBoardGroupList();

        TreeMaker tm = new TreeMaker();
        String treeStr = tm.makeTreeByHierarchy(listview);
        
        response.setContentType("application/json;charset=UTF-8");
        try {
            response.getWriter().print(treeStr);
        } catch (IOException ex) {
            LOGGER.error("boardListByAjax");
        }
        
    }
    
    /*===================================================================== */
    /**
     * 좋아요 저장.     
     */
    @RequestMapping(value = "/addBoardLike")
    public void addBoardLike(HttpServletRequest request, HttpServletResponse response) {
        String brdno = request.getParameter("brdno");
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();

        boardSvc.insertBoardLike( new Field3VO(brdno, userno, null) );

        UtilEtc.responseJsonValue(response, "OK");
    }
        
    /*===================================================================== */
    
    /**
     * 댓글 저장.
     */
    @RequestMapping(value = "/boardReplySave")
    public String boardReplySave(HttpServletRequest request, HttpServletResponse response, BoardReplyVO boardReplyInfo, ModelMap modelMap) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        boardReplyInfo.setFK_SAWON_CODE(userno);

        if (boardReplyInfo.getReno() != null && !"".equals(boardReplyInfo.getReno())) {    // check auth for update
            String chk = boardSvc.selectBoardReplyAuthChk(boardReplyInfo);
            if (chk == null) {
                UtilEtc.responseJsonValue(response, "");
                return null;
            }
        }

        boardReplyInfo = boardSvc.insertBoardReply(boardReplyInfo);
        //boardReplyInfo.setRewriter(request.getSession().getAttribute("usernm").toString());

        modelMap.addAttribute("replyInfo", boardReplyInfo);
        
        return "system/p0003/BoardReadAjax4Reply";        
    }
    
    /**
     * 댓글 삭제.
     */
    @RequestMapping(value = "/boardReplyDelete")
    public void boardReplyDelete(HttpServletRequest request, HttpServletResponse response, BoardReplyVO boardReplyInfo) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        boardReplyInfo.setFK_SAWON_CODE(userno);

        if (boardReplyInfo.getReno() != null && !"".equals(boardReplyInfo.getReno())) {    // check auth for update
            String chk = boardSvc.selectBoardReplyAuthChk(boardReplyInfo);
            if (chk == null) {
                UtilEtc.responseJsonValue(response, "FailAuth");
                return;
            }
        }
        
        if (!boardSvc.deleteBoardReply(boardReplyInfo.getReno()) ) {
            UtilEtc.responseJsonValue(response, "Fail");
        } else {
            UtilEtc.responseJsonValue(response, "OK");
        }
    }
   
}
