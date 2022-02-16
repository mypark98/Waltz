package com.kkanbu.waltz.util;

public class AuthInfo {
   
   private String id;
   private String password;
   private String name;
   private String email;
   private String phone;
   private String address;
   private String detailAddress;
   private String manager;
   private String authkey;
   private String authstatus;
   
   public AuthInfo(String id, String password, String name, String email, String phone, String address, String detailAddress, String manager, String authkey, String authstatus) {
      this.id = id;
      this.password = password;
      this.name = name;
      this.email = email;
      this.phone = phone;
      this.address = address;
      this.detailAddress = detailAddress;
      this.manager = manager;
      this.authkey = authkey;
      this.authstatus = authstatus;
   }
   
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