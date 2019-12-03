package hr.human.p0009.vo;

import java.security.Timestamp;
import java.sql.Date;

import javax.xml.crypto.Data;

import org.springframework.stereotype.Component;

import oracle.sql.DATE;

@Component("education_statusVO")
public class education_statusVO {

	//==========================educaton_status======================================
        private String fk_EDUCATION_STATUS_SAWON_CODE;     // ����ڵ�
     	private String education_STATUS_SAWON_NAME;      //�����
    	private String education_STATUS_DEPT;        // �μ�
    	private String education_STATUS_POSITION;    // ��å
     	private String fk_EDUCATION_STATUS_EDU_CODE;    //�����ڵ�
     	private String education_STATUS_NAME;        //������
     	private String education_STATUS_STA;         //����������
     	private String education_STATUS_END;         //����������
     	private String education_STATUS_DAYS;        //�����ϼ�
     	private String education_STATUS_COMP;        //�̼�����
     	private String education_STATUS_ATTI;        //�µ�����
     	private String education_STATUS_ATTE;        //�⼮����
     	private String education_STATUS_SCORE;       //������
     	private String education_STATUS_SUM;         //�հ�
     	private String education_STATUS_PUR;         //��������
    	private String education_STATUS_LOCA;        //�������
     	private String education_STATUS_TEA;         //��簭��
     	private String education_STATUS_AGENCY;      //�������
     	private String education_STATUS_TIMES;       //�����ð�
     	private String education_STATUS_INT_USER_ID; //�Է���
     	private String education_STATUS_INT_DATE;    //�Է��Ͻ�
     	private String education_STATUS_USER_ID;     //������
     	private String education_STATUS_MOD_DATE;    //�����Ͻ�
	
	//=======================education_mana===============================
     	 
     	
     	private String pk_EDUCATION_MANA_CODE;           //
     	private String education_MANA_NAME;
     	private String education_MANA_STA;
     	private String education_MANA_END;
     	private String education_MANA_TIMES;
     	private String education_MANA_DAYS;
     	
    //=======================education_eval===============================
     	
     	private String pk_EDUCATION_EVAL_SAWON_CODE;   //����ڵ�
     	private String fk_EDUCATION_EVAL_SAWON_NAME;	  //�����
     	private String education_EVAL_EDU_CODE;	      //�����ڵ�
     	private String education_EVAL_NAME;	          //������
     	private String education_EVAL_STA;		      //����������
     	private String education_EVAL_END;		      //����������
     	private String education_EVAL_TIMES;	          //�����ð�
     	private String education_EVAL_DAYS;		      //�����ϼ�
     	private String education_EVAL_COMP;		      //�̼�����
     	private String education_EVAL_ATTE;		      //�⼮����
     	private String education_EVAL_ATTI;		      //�µ�����
     	private String education_EVAL_SCORE;		      //������
     	private String education_EVAL_SUM;		      //�հ�
	
	
	
	// ���� ���� �������� GET, SET ���� 
	
	
	public education_statusVO() {
		System.out.println("education_statusVO ����");
	}

	//==========================educaton_status======================================

	public String getFk_EDUCATION_STATUS_SAWON_CODE() {
		return fk_EDUCATION_STATUS_SAWON_CODE;
	}



	public void setFk_EDUCATION_STATUS_SAWON_CODE(String fk_EDUCATION_STATUS_SAWON_CODE) {
		this.fk_EDUCATION_STATUS_SAWON_CODE = fk_EDUCATION_STATUS_SAWON_CODE;
	}



	public String getEducation_STATUS_SAWON_NAME() {
		return education_STATUS_SAWON_NAME;
	}



	public void setEducation_STATUS_SAWON_NAME(String education_STATUS_SAWON_NAME) {
		this.education_STATUS_SAWON_NAME = education_STATUS_SAWON_NAME;
	}



	public String getEducation_STATUS_DEPT() {
		return education_STATUS_DEPT;
	}



	public void setEducation_STATUS_DEPT(String education_STATUS_DEPT) {
		this.education_STATUS_DEPT = education_STATUS_DEPT;
	}



	public String getEducation_STATUS_POSITION() {
		return education_STATUS_POSITION;
	}



	public void setEducation_STATUS_POSITION(String education_STATUS_POSITION) {
		this.education_STATUS_POSITION = education_STATUS_POSITION;
	}



	public String getFk_EDUCATION_STATUS_EDU_CODE() {
		return fk_EDUCATION_STATUS_EDU_CODE;
	}



	public void setFk_EDUCATION_STATUS_EDU_CODE(String fk_EDUCATION_STATUS_EDU_CODE) {
		this.fk_EDUCATION_STATUS_EDU_CODE = fk_EDUCATION_STATUS_EDU_CODE;
	}



	public String getEducation_STATUS_NAME() {
		return education_STATUS_NAME;
	}



	public void setEducation_STATUS_NAME(String education_STATUS_NAME) {
		this.education_STATUS_NAME = education_STATUS_NAME;
	}



	public String getEducation_STATUS_STA() {
		return education_STATUS_STA;
	}



	public void setEducation_STATUS_STA(String education_STATUS_STA) {
		this.education_STATUS_STA = education_STATUS_STA;
	}



	public String getEducation_STATUS_END() {
		return education_STATUS_END;
	}



	public void setEducation_STATUS_END(String education_STATUS_END) {
		this.education_STATUS_END = education_STATUS_END;
	}



	public String getEducation_STATUS_DAYS() {
		return education_STATUS_DAYS;
	}



	public void setEducation_STATUS_DAYS(String education_STATUS_DAYS) {
		this.education_STATUS_DAYS = education_STATUS_DAYS;
	}



	public String getEducation_STATUS_COMP() {
		return education_STATUS_COMP;
	}



	public void setEducation_STATUS_COMP(String education_STATUS_COMP) {
		this.education_STATUS_COMP = education_STATUS_COMP;
	}



	public String getEducation_STATUS_ATTI() {
		return education_STATUS_ATTI;
	}



	public void setEducation_STATUS_ATTI(String education_STATUS_ATTI) {
		this.education_STATUS_ATTI = education_STATUS_ATTI;
	}



	public String getEducation_STATUS_ATTE() {
		return education_STATUS_ATTE;
	}



	public void setEducation_STATUS_ATTE(String education_STATUS_ATTE) {
		this.education_STATUS_ATTE = education_STATUS_ATTE;
	}



	public String getEducation_STATUS_SCORE() {
		return education_STATUS_SCORE;
	}



	public void setEducation_STATUS_SCORE(String education_STATUS_SCORE) {
		this.education_STATUS_SCORE = education_STATUS_SCORE;
	}



	public String getEducation_STATUS_SUM() {
		return education_STATUS_SUM;
	}



	public void setEducation_STATUS_SUM(String education_STATUS_SUM) {
		this.education_STATUS_SUM = education_STATUS_SUM;
	}



	public String getEducation_STATUS_PUR() {
		return education_STATUS_PUR;
	}



	public void setEducation_STATUS_PUR(String education_STATUS_PUR) {
		this.education_STATUS_PUR = education_STATUS_PUR;
	}



	public String getEducation_STATUS_LOCA() {
		return education_STATUS_LOCA;
	}



	public void setEducation_STATUS_LOCA(String education_STATUS_LOCA) {
		this.education_STATUS_LOCA = education_STATUS_LOCA;
	}



	public String getEducation_STATUS_TEA() {
		return education_STATUS_TEA;
	}



	public void setEducation_STATUS_TEA(String education_STATUS_TEA) {
		this.education_STATUS_TEA = education_STATUS_TEA;
	}



	public String getEducation_STATUS_AGENCY() {
		return education_STATUS_AGENCY;
	}



	public void setEducation_STATUS_AGENCY(String education_STATUS_AGENCY) {
		this.education_STATUS_AGENCY = education_STATUS_AGENCY;
	}



	public String getEducation_STATUS_TIMES() {
		return education_STATUS_TIMES;
	}



	public void setEducation_STATUS_TIMES(String education_STATUS_TIMES) {
		this.education_STATUS_TIMES = education_STATUS_TIMES;
	}



	public String getEducation_STATUS_INT_USER_ID() {
		return education_STATUS_INT_USER_ID;
	}



	public void setEducation_STATUS_INT_USER_ID(String education_STATUS_INT_USER_ID) {
		this.education_STATUS_INT_USER_ID = education_STATUS_INT_USER_ID;
	}



	public String getEducation_STATUS_INT_DATE() {
		return education_STATUS_INT_DATE;
	}



	public void setEducation_STATUS_INT_DATE(String education_STATUS_INT_DATE) {
		this.education_STATUS_INT_DATE = education_STATUS_INT_DATE;
	}



	public String getEducation_STATUS_USER_ID() {
		return education_STATUS_USER_ID;
	}



	public void setEducation_STATUS_USER_ID(String education_STATUS_USER_ID) {
		this.education_STATUS_USER_ID = education_STATUS_USER_ID;
	}



	public String getEducation_STATUS_MOD_DATE() {
		return education_STATUS_MOD_DATE;
	}



	public void setEducation_STATUS_MOD_DATE(String education_STATUS_MOD_DATE) {
		this.education_STATUS_MOD_DATE = education_STATUS_MOD_DATE;
	}

	//=============================education_mana===========================================
	
	public String getPk_EDUCATION_MANA_CODE() {
		return pk_EDUCATION_MANA_CODE;
	}

	public void setPk_EDUCATION_MANA_CODE(String pk_EDUCATION_MANA_CODE) {
		this.pk_EDUCATION_MANA_CODE = pk_EDUCATION_MANA_CODE;
	}

	public String getEducation_MANA_NAME() {
		return education_MANA_NAME;
	}

	public void setEducation_MANA_NAME(String education_MANA_NAME) {
		this.education_MANA_NAME = education_MANA_NAME;
	}

	public String getEducation_MANA_STA() {
		return education_MANA_STA;
	}

	public void setEducation_MANA_STA(String education_MANA_STA) {
		this.education_MANA_STA = education_MANA_STA;
	}

	public String getEducation_MANA_END() {
		return education_MANA_END;
	}

	public void setEducation_MANA_END(String education_MANA_END) {
		this.education_MANA_END = education_MANA_END;
	}

	public String getEducation_MANA_TIMES() {
		return education_MANA_TIMES;
	}

	public void setEducation_MANA_TIMES(String education_MANA_TIMES) {
		this.education_MANA_TIMES = education_MANA_TIMES;
	}

	public String getEducation_MANA_DAYS() {
		return education_MANA_DAYS;
	}

	public void setEducation_MANA_DAYS(String education_MANA_DAYS) {
		this.education_MANA_DAYS = education_MANA_DAYS;
	}

	
	
	//==========================educaton_eval======================================
	
	public String getPk_EDUCATION_EVAL_SAWON_CODE() {
		return pk_EDUCATION_EVAL_SAWON_CODE;
	}



	public void setPk_EDUCATION_EVAL_SAWON_CODE(String pk_EDUCATION_EVAL_SAWON_CODE) {
		this.pk_EDUCATION_EVAL_SAWON_CODE = pk_EDUCATION_EVAL_SAWON_CODE;
	}



	public String getFk_EDUCATION_EVAL_SAWON_NAME() {
		return fk_EDUCATION_EVAL_SAWON_NAME;
	}



	public void setFk_EDUCATION_EVAL_SAWON_NAME(String fk_EDUCATION_EVAL_SAWON_NAME) {
		this.fk_EDUCATION_EVAL_SAWON_NAME = fk_EDUCATION_EVAL_SAWON_NAME;
	}



	public String getEducation_EVAL_EDU_CODE() {
		return education_EVAL_EDU_CODE;
	}



	public void setEducation_EVAL_EDU_CODE(String education_EVAL_EDU_CODE) {
		this.education_EVAL_EDU_CODE = education_EVAL_EDU_CODE;
	}



	public String getEducation_EVAL_NAME() {
		return education_EVAL_NAME;
	}



	public void setEducation_EVAL_NAME(String education_EVAL_NAME) {
		this.education_EVAL_NAME = education_EVAL_NAME;
	}



	public String getEducation_EVAL_STA() {
		return education_EVAL_STA;
	}



	public void setEducation_EVAL_STA(String education_EVAL_STA) {
		this.education_EVAL_STA = education_EVAL_STA;
	}



	public String getEducation_EVAL_END() {
		return education_EVAL_END;
	}



	public void setEducation_EVAL_END(String education_EVAL_END) {
		this.education_EVAL_END = education_EVAL_END;
	}



	public String getEducation_EVAL_TIMES() {
		return education_EVAL_TIMES;
	}



	public void setEducation_EVAL_TIMES(String education_EVAL_TIMES) {
		this.education_EVAL_TIMES = education_EVAL_TIMES;
	}



	public String getEducation_EVAL_DAYS() {
		return education_EVAL_DAYS;
	}



	public void setEducation_EVAL_DAYS(String education_EVAL_DAYS) {
		this.education_EVAL_DAYS = education_EVAL_DAYS;
	}



	public String getEducation_EVAL_COMP() {
		return education_EVAL_COMP;
	}



	public void setEducation_EVAL_COMP(String education_EVAL_COMP) {
		this.education_EVAL_COMP = education_EVAL_COMP;
	}



	public String getEducation_EVAL_ATTE() {
		return education_EVAL_ATTE;
	}



	public void setEducation_EVAL_ATTE(String education_EVAL_ATTE) {
		this.education_EVAL_ATTE = education_EVAL_ATTE;
	}



	public String getEducation_EVAL_ATTI() {
		return education_EVAL_ATTI;
	}



	public void setEducation_EVAL_ATTI(String education_EVAL_ATTI) {
		this.education_EVAL_ATTI = education_EVAL_ATTI;
	}



	public String getEducation_EVAL_SCORE() {
		return education_EVAL_SCORE;
	}



	public void setEducation_EVAL_SCORE(String education_EVAL_SCORE) {
		this.education_EVAL_SCORE = education_EVAL_SCORE;
	}



	public String getEducation_EVAL_SUM() {
		return education_EVAL_SUM;
	}



	public void setEducation_EVAL_SUM(String education_EVAL_SUM) {
		this.education_EVAL_SUM = education_EVAL_SUM;
	}





    

}