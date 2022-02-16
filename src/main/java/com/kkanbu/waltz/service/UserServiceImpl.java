package com.kkanbu.waltz.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import com.kkanbu.waltz.dao.UserDAO;
import com.kkanbu.waltz.exception.AlreadyExistingEmailException;
import com.kkanbu.waltz.exception.AlreadyExistingIdException;
import com.kkanbu.waltz.exception.IdPasswordNotMatchingException;
import com.kkanbu.waltz.util.AuthInfo;
import com.kkanbu.waltz.util.LoginCommand;
import com.kkanbu.waltz.util.MailUtils;
import com.kkanbu.waltz.util.RegisterRequest;
import com.kkanbu.waltz.util.TempKey;
import com.kkanbu.waltz.vo.UserVO;
import com.kkanbu.waltz.vo.petVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	TransactionTemplate transactionTemplate;

    @Resource(name="userDAO")
    private UserDAO userDAO;
    
	@Autowired
	private JavaMailSender mailSender;
 
    @Override
    public void register(RegisterRequest regReq) throws Exception {
        UserVO email = userDAO.selectByEmail(regReq.getEmail());
        if(email!=null) {
            throw new AlreadyExistingEmailException(regReq.getEmail()+" is duplicate email.");
        }
        UserVO id = userDAO.selectById(regReq.getId());
        if(id!=null) {
            throw new AlreadyExistingIdException(regReq.getId()+" is duplicate id.");
        }
        userDAO.insertUser(regReq);
        
        // 임의의 authkey 생성
     	String authkey = new TempKey().getKey(50, false);

     	regReq.setAuthkey(authkey);
     	
     	// 인증키 DB에 저장
     	userDAO.createAuthkey(regReq);

     	// 메일 발송
     	MailUtils sendMail = new MailUtils(mailSender);

     	sendMail.setSubject("[Waltz] 회원가입 이메일 인증");
     	sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
     			.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
     			.append("<a href='http://localhost:8090/register/emailConfirm?name=")
     			.append(regReq.getName())
     			.append("&email=")
     			.append(regReq.getEmail())
     			.append("&authkey=")
     			.append(authkey)
     			.append("' target='_blank'>이메일 인증 확인</a>")
     			.toString());
     	sendMail.setFrom("tkghl113@gmail.com ", "waltz관리자");
     	sendMail.setTo(regReq.getEmail());
     	sendMail.send();
    }
    
    @Override
    public void petRegister(petVO pVo) {
    	userDAO.insertPet(pVo);
    }
 
    @Override
    public AuthInfo loginAuth(LoginCommand loginCommand) throws Exception {
    	
        UserVO user = userDAO.selectById(loginCommand.getId());
        if(user == null) {
            throw new IdPasswordNotMatchingException();
        }
        return new AuthInfo(user.getMEM_ID(), user.getMEM_PW(), user.getMEM_NAME(), user.getMEM_EMAIL(), user.getMEM_PHONE(), user.getMEM_ADDRESS(), user.getMEM_DETAILADDRESS(), user.getMEM_MANAGER(), user.getMEM_AUTHKEY(), user.getMEM_AUTHSTATUS());
    }
    
    @Override
    public UserVO login(UserVO vo) throws Exception {
    	
       return userDAO.login(vo);
    }

    @Override
    public void memberUpdate(UserVO vo) throws Exception {   	
    	//받은 vo를 DAO로 보내줍니다.
    	userDAO.updateUser(vo);  	
    }
    
	@Override
	public void memberDelete(UserVO vo) throws Exception {
		userDAO.deleteUser(vo);
	}
	
	@Override
	public int passChk(UserVO vo) throws Exception {
		int result = userDAO.passChk(vo);
		return result;
	}
	
	@Override
	public int idChk(UserVO vo) throws Exception {
		int result = userDAO.idChk(vo);
		return result;
	}
	
	@Override
	public List<UserVO> userList() {
		return userDAO.userList();
	}

	public UserVO viewUser(String id) {
		return userDAO.selectById(id);
	}
	
	  // authstatus 1로 변경
	  @Override
	  public void updateAuthstatus(RegisterRequest regReq) throws Exception {
	      userDAO.updateAuthStatus(regReq);
	  }
	  
	  
	  @Override
	  public List<UserVO> myPost(String id) {
	      return userDAO.myPost(id);
	   }
	  
	    @Override
	    public petVO myPet(String id) {
	       return userDAO.myPet(id);
	    }    
	  

}
