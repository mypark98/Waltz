package com.kkanbu.waltz.util;

public class RegisterRequest {
   
   private String id;
   private String password;
   private String confirmPassword; // 비밀번호 확인
   private String name;
   private String email;
   private String phone;
   private String address;
   private String manager;
   private String authkey;
   private String authstatus;
   private String detailAddress;
   
   
    public String getDetailAddress() {
      return detailAddress;
   }

   public void setDetailAddress(String detailAddress) {
      this.detailAddress = detailAddress;
   }

   public String getAuthkey() {
      return authkey;
   }

   public void setAuthkey(String authkey) {
      this.authkey = authkey;
   }

   public String getAuthstatus() {
      return authstatus;
   }

   public void setAuthstatus(String authstatus) {
      this.authstatus = authstatus;
   }

   //비밀번호 확인
    public boolean isPwEqualToCheckPw() {
        return password.equals(confirmPassword);
    }
   
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getConfirmPassword() {
      return confirmPassword;
   }
   public void setConfirmPassword(String confirmPassword) {
      this.confirmPassword = confirmPassword;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getManager() {
      return manager;
   }
   public void setManager(String manager) {
      this.manager = manager;
   }
   
   
}