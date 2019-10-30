package hr.elect.p0001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.elect.p0001.vo.SignVO;
import project.common.SearchVO;




public interface SignDAO {
	 public Integer selectSignDocTobeCount(SearchVO param) throws DataAccessException;
	 public List<?> selectSignDocTobeList(SearchVO param) throws DataAccessException;

	 
}
