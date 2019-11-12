package project.common;

public class FileVO {
    private Integer fileno; 
    private String parentPK;
    private String filename;
    private String realname;
    private long filesize;
    private String PK_SAWON_CODE;
    
    /**
     * 파일 크기를 정형화하기.
     */
    public String size2String() {
        Integer unit = 1024;
        if (filesize < unit) {
            return String.format("(%d B)", filesize);
        }
        int exp = (int) (Math.log(filesize) / Math.log(unit));

        return String.format("(%.0f %s)", filesize / Math.pow(unit, exp), "KMGTPE".charAt(exp - 1));
    }
    
    public Integer getFileno() {
        return fileno;
    }

    public void setFileno(Integer fileno) {
        this.fileno = fileno;
    }

    public String getParentPK() {
        return parentPK;
    }
    
    public void setParentPK(String parentPK) {
        this.parentPK = parentPK;
    } 
    
    public String getFilename() {
        return filename;
    }
    
    public void setFilename(String filename) {
        this.filename = filename;
    }
    
    public String getRealname() {
        return realname;
    }
    
    public void setRealname(String realname) {
        this.realname = realname;
    }
    
    public long getFilesize() {
        return filesize;
    }
    
    public void setFilesize(long filesize) {
        this.filesize = filesize;
    }

	public String getPK_SAWON_CODE() {
		return PK_SAWON_CODE;
	}

	public void setPK_SAWON_CODE(String pK_SAWON_CODE) {
		PK_SAWON_CODE = pK_SAWON_CODE;
	}
    
}
