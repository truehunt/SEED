package project.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//import com.ibleaders.ibsheet7.ibsheet.excel.DirectDown2Excel;
//import com.ibleaders.ibsheet7.util.DirectDown2ExcelCallbackInterface;





/**
 * @Class Name : IBSheetFileController.java
 * @Description : IBSheetFileController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2016.08.06  shkim         최초생성
 *
 * @author ibleaders 기술지원팀
 * @since 2016. 10.02
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Controller
public class IBSheetFileController {

	@RequestMapping(value = "sheet/Down2Excel.do")
	public String Down2Excel(HttpServletRequest req,HttpServletResponse res) throws Exception {
		return "sheet/importexport/Down2Excel";
	}
	@RequestMapping(value = "sheet/LoadExcel.do")
	public String LoadExcel(HttpServletRequest req,HttpServletResponse res) throws Exception {
		return "sheet/importexport/LoadExcel";
	}
	@RequestMapping(value = "sheet/Down2Text.do")
	public String Down2Text(HttpServletRequest req,HttpServletResponse res) throws Exception {
		return "sheet/importexport/Down2Text";
	}
	@RequestMapping(value = "sheet/LoadText.do")
	public String LoadText(HttpServletRequest req,HttpServletResponse res) throws Exception {
		return "sheet/importexport/LoadText";
	}
	@RequestMapping(value = "sheet/DirectLoadExcel.do")
	public String DirectLoadExcel(HttpServletRequest req,HttpServletResponse res) throws Exception {
		return "sheet/importexport/DirectLoadExcel";
	}
	@RequestMapping(value = "sheet/Down2Pdf.do")
	public String Down2Pdf(HttpServletRequest req,HttpServletResponse res) throws Exception {
		return "sheet/importexport/Down2Pdf";
	}
	
	
	
}
