package com.kkanbu.waltz.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kkanbu.waltz.util.RegisterRequest;
import com.kkanbu.waltz.vo.UserVO;
import com.kkanbu.waltz.vo.petVO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	
    public UserVO selectByEmail(String email) {
        return (UserVO)selectOne("user.selectByEmail", email);
    }
 
    public UserVO selectById(String id) {
        return (UserVO)selectOne("user.selectById", id);
    }
    
    public UserVO login(UserVO vo) {
        return (UserVO)selectOne("user.login", vo);
    }
    
    public void createAuthkey(RegisterRequest regReq) {
    	insert("user.createAuthkey", regReq);
    }
 
    public void insertUser(RegisterRequest regReq) {
        insert("user.register", regReq);
    }
    
    public void insertPet(petVO pVo) {
        insert("user.petRegister", pVo);
    }
       
    public void updateUser(UserVO vo) {
        update("user.update", vo);
    }
    
    public void deleteUser(UserVO vo) {
    	delete("user.delete", vo);
    }
    
    public int passChk(UserVO vo) {
    	return passChk("user.passChk", vo);
    }
    
    public int idChk(UserVO vo) {
    	return idChk("user.idChk", vo);
    }
    
    public List<UserVO> userList() {
    	return selectList("user.userList");
    }
    
    public void updateAuthStatus(RegisterRequest regReq) {
        update("user.updateAuthstatus", regReq);
    }
    
    public List<UserVO> myPost(String id) {
        return selectList("user.myPost", id);
     }
    
    public petVO myPet(String id) {
        return (petVO)selectOne("user.myPet", id);
    }
    
    
    
}

