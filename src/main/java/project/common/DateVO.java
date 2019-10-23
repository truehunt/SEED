package project.common;

import java.util.List;

public class DateVO {
    private int YEAR;
    private int MONTH;
    private int DAY;
    private String DATE, WEEK;
    private boolean ISTODAY = false;
    private List<?> LIST;
	public int getYEAR() {
		return YEAR;
	}
	public void setYEAR(int yEAR) {
		YEAR = yEAR;
	}
	public int getMONTH() {
		return MONTH;
	}
	public void setMONTH(int mONTH) {
		MONTH = mONTH;
	}
	public int getDAY() {
		return DAY;
	}
	public void setDAY(int dAY) {
		DAY = dAY;
	}
	public String getDATE() {
		return DATE;
	}
	public void setDATE(String dATE) {
		DATE = dATE;
	}
	public String getWEEK() {
		return WEEK;
	}
	public void setWEEK(String wEEK) {
		WEEK = wEEK;
	}
	public boolean isISTODAY() {
		return ISTODAY;
	}
	public void setISTODAY(boolean iSTODAY) {
		ISTODAY = iSTODAY;
	}
	public List<?> getLIST() {
		return LIST;
	}
	public void setLIST(List<?> lIST) {
		LIST = lIST;
	} 
    
   
   
}