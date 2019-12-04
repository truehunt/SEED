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
import project.common.SearchVO;
import project.common.TreeMaker;
import project.common.UtilEtc;
import project.common.DeptSvc;
import project.common.EtcSvc;
import hr.elect.p0002.vo.SignLinePathVO;
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
     * 사용자 권한 설정 리스트.
     */
    @RequestMapping(value = "/adSawon_Permission")
       public String user(HttpServletRequest request, ModelMap modelMap) {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        
        //etcSvc.setCommonAttribute(userno, modelMap);
        
        List<?> listview   = deptSvc.selectDepartment();

        TreeMaker tm = new TreeMaker();
        String treeStr = tm.makeTreeByHierarchy(listview);
        
        modelMap.addAttribute("treeStr", treeStr);
        
        return "system/p0001/Sawon_Permission";
    }
    
    /**
     * 부서를 선택했을때 그에 해당되는 사원 리스트.
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
        
        return "system/p0001/Sawon_List";
    }
    
    /*
     * 사용자 권한 변경 업데이트
     * 
     */
    @RequestMapping(value = "/adSawonPermissionsUpdate")
    public String SawonPermissionsUpdate(HttpServletResponse response, ModelMap modelMap, SawonVO userInfo) {

    	// PK_SAWON_CODE = "on, 2019006, 2019007, 2019003, admin" 값 분해해서 각각 업데이트 치기
    	String pk = userInfo.getPK_SAWON_CODE();
			
		String[] temp = pk.split("\\,");
		
		for(int temp_num=0 ; temp_num<temp.length; temp_num++) {
			
			String temp1 = temp[temp_num]; // temp[0] = on, temp[1] = 2019006
			userInfo.setPK_SAWON_CODE(temp1);
			sawonSvc.SawonPermissionsUpdate(userInfo);
		}

        return common_UserList(modelMap, userInfo.getFK_DEPT_CODE());
    }
    
    /**
     * 직원조회.(ESS)
     */
    @RequestMapping(value = "/searchMember")
    public String searchMember(SearchVO searchVO, ModelMap modelMap) {
        
        // if (searchVO.getSearchKeyword() != null & !"".equals(searchVO.getSearchKeyword())) {
            searchVO.pageCalculate( sawonSvc.selectSearchMemberCount(searchVO) ); // startRow, endRow
            
            List<?> listview = sawonSvc.selectSearchMemberList(searchVO);
        
            modelMap.addAttribute("listview", listview);
        // }
        modelMap.addAttribute("searchVO", searchVO);
        return "system/p0001/searchSawon";
    }
    
    /**
     * 사용자 조회.
     */
    @RequestMapping(value = "/myinfo")
    public String userRead(HttpServletRequest request, HttpServletResponse response) {
        String userno = request.getParameter("PK_SAWON_CODE");
        
        // SawonVO userInfo = sawonSvc.selectUserOne(userno);

        // UtilEtc.responseJsonValue(response, userInfo);
        
        return "system/p0001/Sawon_Myinfo";
    }
    
}
