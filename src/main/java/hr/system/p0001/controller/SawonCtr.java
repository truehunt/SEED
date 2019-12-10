package hr.system.p0001.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.common.SearchVO;
import project.common.TreeMaker;
import project.common.DeptSvc;
import project.common.EtcSvc;
import hr.human.p0001.vo.AssVO;
import hr.human.p0001.vo.CarVO;
import hr.human.p0001.vo.CardFamVO;
import hr.human.p0001.vo.CardVO;
import hr.human.p0001.vo.CertVO;
import hr.human.p0001.vo.ChjVO;
import hr.human.p0001.vo.HlVO;
import hr.human.p0001.vo.SbVO;
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
    public String myInfo(HttpServletRequest request, ModelMap modelMap) {
        
    	String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        modelMap.addAttribute("PK_SAWON_CODE", userno);
        
        //데이터 조회
  		List<?> listview = sawonSvc.myISA(userno);
  		modelMap.addAttribute("listview", listview);
        
        return "system/p0001/Sawon_Myinfo";
    }
    
    // 내정보보기_가족_조회
	@RequestMapping(value = "/myISA_fam", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map myISA_fam(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
		
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("PK_SAWON_CODE", userno);
		//데이터 조회
		List<CardFamVO> data = sawonSvc.myISA_fam(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	// 내정보보기_학력_조회
	@RequestMapping(value = "/myISA_hl", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ISA_hl(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
		
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("PK_SAWON_CODE", userno);
		//데이터 조회
		List<HlVO> data = sawonSvc.myISA_hl(searchMap);
	    resultMap.put("Data", data);
	      
	    return resultMap;
	}
	
	// 내정보보기_경력_조회
	@RequestMapping(value = "/myISA_car", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ISA_car(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
		
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("PK_SAWON_CODE", userno);
		//데이터 조회
		List<CarVO> data = sawonSvc.myISA_car(searchMap);
	    resultMap.put("Data", data);
	      
	    return resultMap;
	}
	
	// 내정보보기_면허/자격_조회
	@RequestMapping(value = "/myISA_cert", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ISA_cert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();

		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("PK_SAWON_CODE", userno);
		//데이터 조회
		List<CertVO> data = sawonSvc.myISA_cert(searchMap);
		resultMap.put("Data", data);
			      
		return resultMap;
	}
	
	// 내정보보기_고과_조회
	@RequestMapping(value = "/myISA_ass", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ISA_ass(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("PK_SAWON_CODE", userno);

		//데이터 조회
		List<AssVO> data = sawonSvc.myISA_ass(searchMap);
		
	    resultMap.put("Data", data);
	    return resultMap;
	    
	}
	
	// 내정보보기_출장_조회
	@RequestMapping(value = "/myISA_chj", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ISA_chj(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
		
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("PK_SAWON_CODE", userno); 

		//데이터 조회 
		List<ChjVO> data = sawonSvc.myISA_chj(searchMap);
	    resultMap.put("Data", data);
	      
	    return resultMap;
	}
	
	// 내정보보기_상벌_조회
	@RequestMapping(value = "/myISA_sb", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map ISA_sb(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		// 검색조건설정
		searchMap.put("PK_SAWON_CODE", userno); 

		//데이터 조회
		List<SbVO> data = sawonSvc.myISA_sb(searchMap);
	    resultMap.put("Data", data);
	      
	    return resultMap;
	}
	
	/**
     * 비밀번호 변경.
	 * @throws IOException 
     */
    @RequestMapping(value = "/changePWSave")
    public void changePWSave(HttpServletRequest request, HttpServletResponse response, SawonVO userInfo) throws IOException {
        String userno = request.getSession().getAttribute("PK_SAWON_CODE").toString();
        
        String newpw = request.getParameter("newpw");
        
        userInfo.setPK_SAWON_CODE(userno);
        userInfo.setNewpw(newpw);
        
        sawonSvc.updateUserPassword(response, userInfo);

    }
    
    /**
     * 캡차값 가져오기
     */
    @RequestMapping(value = "/getCAPTCHA", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public String getCAPTCHA(HttpServletRequest request) {
        
    	String answer = request.getSession().getAttribute("CAPTCHA").toString();
        return answer;
    }
    
    
}
