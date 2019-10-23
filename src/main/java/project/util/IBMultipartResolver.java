package project.util;

import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * 엑셀 다운로드 업로드를 위한 MultipartResolver 스프링의 CommonsMultipartResolver를 상속하였음<br>
 * 멀티파트리졸버가 모든 리퀘스트에 대해 멀티파트일때 처리를하기 때문에 IBSheet의 멀티파트까지 가져가서 파싱해버림<br>
 * 따라서 업로드 다운로드 처리하는 jsp는 리퀘스트에서 스트림을 읽어 올수 없는 문제가 있음<br>
 * <br>
 * 이 리졸버는 IBSheet의 멀티파트인지만 판별해서 IBSheet의 멀티파트일경우 멀티파트가 아닌 것 처럼 결과를 돌려주어서 스프링 멀티파트리졸버가 
 * 처리를 하지 못하도록 하는 역할을 함<br>
 * 
 * @author wrix
 * @since 0.0.3
 */
public class IBMultipartResolver extends CommonsMultipartResolver {
	public boolean isMultipart(HttpServletRequest request) {
		
		//ibsheet를 통한 호출
		String sheetwork = request.getParameter("SheetWork");
		if(sheetwork != null) {
			return false;
		}
		
		//ibupload를 통한 호출
		String Ajax = request.getHeader("AjaxComponent");
		if("IBUpload".equals(Ajax) ){
			return false;
		}
		
		
		
		return (request != null && ServletFileUpload.isMultipartContent(request));
	}
	
}
