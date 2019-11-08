package hr.system.p0001.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import project.common.FileUtil;
import project.common.FileVO;
import project.common.TreeMaker;
import project.common.UtilEtc;
import project.common.DeptSvc;
import project.common.EtcSvc;
import hr.system.p0001.service.SawonSvc;
import hr.system.p0001.vo.SawonVO;

@Controller
public class SawonCtr {

    @Autowired
    private DeptSvc deptSvc;
    
    @Autowired
    private SawonSvc sawonSvc;
    
    @Autowired
    private EtcSvc etcSvc;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/adUser")
       public String user(HttpServletRequest request, ModelMap modelMap) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        
        //etcSvc.setCommonAttribute(userno, modelMap);
        
        List<?> listview   = deptSvc.selectDepartment();

        TreeMaker tm = new TreeMaker();
        String treeStr = tm.makeTreeByHierarchy(listview);
        
        modelMap.addAttribute("treeStr", treeStr);
        
        return "admin/organ/User";
    }
    
    /**
     * User 리스트.
     */
    @RequestMapping(value = "/adUserList")
    public String userList(HttpServletRequest request, ModelMap modelMap) {
        String deptno = request.getParameter("deptno");

        return common_UserList(modelMap, deptno);
    }
    
    /**
     * 지정된 부서의 사용자 리스트.     
     */
    public String common_UserList(ModelMap modelMap, String deptno) {

        List<?> listview  = sawonSvc.selectUserList(deptno);
        
        modelMap.addAttribute("listview", listview);
        
        return "admin/organ/UserList";
    }
    
    /**
     * 사용자 저장.
     * 신규 사용자는 저장 전에 중복 확인 
     
    @RequestMapping(value = "/adUserSave")
    public String userSave(HttpServletResponse response, ModelMap modelMap, SawonVO userInfo) {

        if (userInfo.getPK_SAWON_CODE() == null || "".equals(userInfo.getPK_SAWON_CODE())) {
            String userid = sawonSvc.selectUserID(userInfo.getUserid());
            if (userid != null) {
                return "common/blank"; 
            }
        }
        FileUtil fs = new FileUtil();
        FileVO fileInfo = fs.saveFile(userInfo.getPhotofile());
        if (fileInfo != null) {
            userInfo.setPhoto(fileInfo.getRealname());
        }
        sawonSvc.insertUser(userInfo);

        return common_UserList(modelMap, userInfo.getDeptno());
    } */
    
    /**
     * ID 중복 확인.
     */
    @RequestMapping(value = "/chkUserid")
    public void chkUserid(HttpServletRequest request, HttpServletResponse response) {
        String userid = request.getParameter("userid");

        userid = sawonSvc.selectUserID(userid);

        UtilEtc.responseJsonValue(response, userid);
    }
    
    /**
     * 사용자 조회.
     */
    @RequestMapping(value = "/adUserRead")
    public void userRead(HttpServletRequest request, HttpServletResponse response) {
        String userno = request.getParameter("PK_SAWON_CODE");
        
        SawonVO userInfo = sawonSvc.selectUserOne(userno);

        UtilEtc.responseJsonValue(response, userInfo);
    }
    
    /**
     * 사용자 삭제.
     */
    @RequestMapping(value = "/adUserDelete")
    public String userDelete(HttpServletRequest request, ModelMap modelMap, SawonVO userInfo) {
        
        sawonSvc.deleteUser(userInfo.getPK_SAWON_CODE());
        
        return common_UserList(modelMap, userInfo.getFK_DEPT_CODE());
    }
}
