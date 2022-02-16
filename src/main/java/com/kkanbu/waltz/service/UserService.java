package com.kkanbu.waltz.service;

import java.util.List;

import com.kkanbu.waltz.util.AuthInfo;
import com.kkanbu.waltz.util.LoginCommand;
import com.kkanbu.waltz.util.RegisterRequest;
import com.kkanbu.waltz.vo.UserVO;
import com.kkanbu.waltz.vo.petVO;

public interface UserService {

	 void register(RegisterRequest regReq) throws Exception;
	 
	 void petRegister(petVO pVo) throws Exception;
	
	 AuthInfo loginAuth(LoginCommand loginCommand) throws Exception;
	 
	 public UserVO login(UserVO vo) throws Exception;
	 
	 public void memberUpdate(UserVO vo) throws Exception;
	 
	 public void memberDelete(UserVO vo) throws Exception;
	 
	 public int passChk(UserVO vo) throws Exception;
	 
	 public int idChk(UserVO vo) throws Exception;
	 
	 public List<UserVO> userList() throws Exception;
	 
	 public UserVO viewUser(String id) throws Exception;
	 
	  // authstatus 1로 변경
	  public void updateAuthstatus(RegisterRequest regReq) throws Exception;
	  
	  public List<UserVO> myPost(String id) throws Exception;
	  
	  public petVO myPet(String id) throws Exception;
	  

}
