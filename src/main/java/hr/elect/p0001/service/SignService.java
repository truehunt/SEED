package hr.elect.p0001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.elect.p0001.vo.SignDocVO;
import hr.elect.p0001.vo.SignVO;



public interface SignService {
	
	public void insertSignDoc(SignDocVO param) throws DataAccessException ;
	public void updateSign(SignVO param) throws DataAccessException ;
	
}
