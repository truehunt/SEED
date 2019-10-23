package hr.system.p0003.vo;

import java.util.List;

public class CalendarVO {

    private String  CDDATE;    	//  날짜
    private Integer CDDD;
    private Integer CDDAYOFWEEK;
    private List<?> LIST;
    
	public String getCDDATE() {
		return CDDATE;
	}
	public void setCDDATE(String cDDATE) {
		CDDATE = cDDATE;
	}
	public Integer getCDDD() {
		return CDDD;
	}
	public void setCDDD(Integer cDDD) {
		CDDD = cDDD;
	}
	public Integer getCDDAYOFWEEK() {
		return CDDAYOFWEEK;
	}
	public void setCDDAYOFWEEK(Integer cDDAYOFWEEK) {
		CDDAYOFWEEK = cDDAYOFWEEK;
	}
	public List<?> getLIST() {
		return LIST;
	}
	public void setLIST(List<?> lIST) {
		LIST = lIST;
	}
    
    
    
}
 