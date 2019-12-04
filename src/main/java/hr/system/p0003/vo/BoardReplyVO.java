package hr.system.p0003.vo;

import project.common.UtilEtc;

public class BoardReplyVO {

	private Integer reorder;
    private String brdno;
    private String reno;
    private String rewriter;
    private String rememo;
    private String redate;
    private String reparent;
    private String redepth;
    private String FK_SAWON_CODE;
    private String photo;

    public String getRememoByHTML() {
        return UtilEtc.text2Html(rememo);
    }
    
    public String getBrdno() {
        return brdno;
    }
    
    public void setBrdno(String brdno) {
        this.brdno = brdno;
    }
    
    public String getReno() {
        return reno;
    }
    
    public void setReno(String reno) {
        this.reno = reno;
    }
    
    public String getRewriter() {
        return rewriter;
    }
    
    public void setRewriter(String rewriter) {
        this.rewriter = rewriter;
    }
    
    public String getRememo() {
        return rememo;
    }
    
    public void setRememo(String rememo) {
        this.rememo = rememo;
    }
    
    public String getRedate() {
        return redate;
    }
    
    public void setRedate(String redate) {
        this.redate = redate;
    }
    
    public String getReparent() {
        return reparent;
    }
    
    public void setReparent(String reparent) {
        this.reparent = reparent;
    }

    public String getRedepth() {
        return redepth;
    }

    public void setRedepth(String redepth) {
        this.redepth = redepth;
    }

    public Integer getReorder() {
		return reorder;
	}

	public void setReorder(Integer reorder) {
		this.reorder = reorder;
	}

	public String getFK_SAWON_CODE() {
		return FK_SAWON_CODE;
	}

	public void setFK_SAWON_CODE(String fK_SAWON_CODE) {
		FK_SAWON_CODE = fK_SAWON_CODE;
	}

	public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    
}
