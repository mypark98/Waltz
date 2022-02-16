package com.kkanbu.waltz.vo;

import java.util.Date;

import com.kkanbu.waltz.exception.IdPasswordNotMatchingException;

public class UserVO {

    private String MEM_ID;
    private String MEM_PW;
    private String MEM_NAME;
    private String MEM_EMAIL;
    private String MEM_PHONE;
    private String MEM_ADDRESS;
    private String MEM_DETAILADDRESS;
    private String MEM_MANAGER;
    private String MEM_AUTHKEY;
    private String MEM_AUTHSTATUS;
    private String BO_NUM;
    private String PO_TITLE;
    private Date PO_DATE;
    private String PO_CLICKS;
    
   public String getBO_NUM() {
      return BO_NUM;
   }

   public void setPO_NUM(String bO_NUM) {
      BO_NUM = bO_NUM;
   }

   public String getPO_TITLE() {
      return PO_TITLE;
   }

   public void setPO_TITLE(String pO_TITLE) {
      PO_TITLE = pO_TITLE;
   }

   public String getPO_CLICKS() {
      return PO_CLICKS;
   }

   public void setPO_CLICKS(String pO_CLICKS) {
      PO_CLICKS = pO_CLICKS;
   }

   

   public Date getPO_DATE() {
	return PO_DATE;
}

	public void setPO_DATE(Date pO_DATE) {
		PO_DATE = pO_DATE;
	}
	
	public void setBO_NUM(String bO_NUM) {
		BO_NUM = bO_NUM;
	}
	
	public String getMEM_DETAILADDRESS() {
	      return MEM_DETAILADDRESS;
	   }

   public void setMEM_DETAILADDRESS(String mEM_DETAILADDRESS) {
      MEM_DETAILADDRESS = mEM_DETAILADDRESS;
   }

   public String getMEM_AUTHKEY() {
      return MEM_AUTHKEY;
   }

   public void setMEM_AUTHKEY(String mEM_AUTHKEY) {
      MEM_AUTHKEY = mEM_AUTHKEY;
   }

   public String getMEM_AUTHSTATUS() {
      return MEM_AUTHSTATUS;
   }

   public void setMEM_AUTHSTATUS(String mEM_AUTHSTATUS) {
      MEM_AUTHSTATUS = mEM_AUTHSTATUS;
   }

   //비밀번호 확인
    public boolean matchPassword(String password) {
        return this.MEM_PW.equals(password);
    }
    
    //비밀번호 수정
    public void changePassword(String oldPassword, String newPassword) { // 기존 pw, 새로운 pw 비교해서 일치하면 변경
      if(!this.MEM_PW.equals(oldPassword)) {// 저장된 패스워드와 입력된 기존 pw가 일치하지 않는다면 예외 발생 시킴
         throw new IdPasswordNotMatchingException(); 
      }
      this.MEM_PW = newPassword; // 저장된 패스워드를 새로 입력된 패스워드로 교체
   }

   public String getMEM_ID() {
      return MEM_ID;
   }

   public void setMEM_ID(String mEM_ID) {
      MEM_ID = mEM_ID;
   }

   public String getMEM_PW() {
      return MEM_PW;
   }

   public void setMEM_PW(String mEM_PW) {
      MEM_PW = mEM_PW;
   }

   public String getMEM_NAME() {
      return MEM_NAME;
   }

   public void setMEM_NAME(String mEM_NAME) {
      MEM_NAME = mEM_NAME;
   }

   public String getMEM_EMAIL() {
      return MEM_EMAIL;
   }

   public void setMEM_EMAIL(String mEM_EMAIL) {
      MEM_EMAIL = mEM_EMAIL;
   }

   public String getMEM_PHONE() {
      return MEM_PHONE;
   }

   public void setMEM_PHONE(String mEM_PHONE) {
      MEM_PHONE = mEM_PHONE;
   }

   public String getMEM_ADDRESS() {
      return MEM_ADDRESS;
   }

   public void setMEM_ADDRESS(String mEM_ADDRESS) {
      MEM_ADDRESS = mEM_ADDRESS;
   }

   public String getMEM_MANAGER() {
      return MEM_MANAGER;
   }

   public void setMEM_MANAGER(String mEM_MANAGER) {
      MEM_MANAGER = mEM_MANAGER;
   }


   
   
}