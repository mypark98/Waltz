<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    <link rel="stylesheet" href="resources/css/question.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
</head>
<body>


 <header>
        <nav id="header_container">
            <ul id="menubar">
                <li>
                    <div>
                        <a href="/"><img src="resources/images/logo.png" alt=""></a>
                    </div>
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="/brand.jsp">브랜드스토리</a> 
                    </div>
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="#">커뮤니케이션</a> 
                    </div>
                    <div class="dropdown_content1">
                        <a href="/contest/contestBoardList">자랑하기</a>
                        <a href="/market/marketBoardList">왈츠장터</a>
                        <a href="../html/find.html">찾아주세요</a>
                        <a href="/board/questionBoardList">궁금해요</a>
                    </div>
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="/tools.jsp">툴즈</a>
                    </div>
                    <div class="dropdown_content2">
                        <a href="/bcs.jsp">비만도</a>
                        <a href="/daykcal.jsp">칼로리</a>
                        <a href="/age.jsp">나이</a>
                        
                    </div>
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="#">진단받기</a>
                    </div>
                    <div class="dropdown_content3">
                        <a href="/vetintro.jsp">수의사 소개</a>
                        <a href="/hospital.jsp">주변 병원</a>         
                    </div> 
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="#">고객센터</a>
                    </div>
                    <div class="dropdown_content4">
                        <a href="/question.jsp">자주 묻는 질문</a>
                        <a href="/oneonone.jsp">1:1 질문하기</a>    
                    </div> 
                </li>
            </ul>
           

<c:catch>
    <c:choose>
        <c:when test="${empty authInfo }">
        <ul id="personal">
        
            <li>
                 <a href="/login" style="font-size:13px;"><i class="fa fa-sign-in"></i> 로그인</a>
             </li>
             <li>
                 <a href="/register/step1" style="font-size:13px;"><i class="fa fa-user"></i> 회원가입</a>
             </li>
         </ul>   
        </c:when>
        <c:otherwise>
            <c:choose>
            
            
                <c:when test="${authInfo.manager eq '1' }">
                <ul id="personal" style="margin-left:780px; margin-top:-52px;">
            
		            <li style="font-size:13px; margin-right:20px; margin-top:2px;">
		            	관리자 ${authInfo.name }
		            </li>
	            		<%-- <h5>관리자 ${authInfo.name }님, 환영합니다.</h5> --%>
	                  
	                 <li>
	                       <a href="/list" style="font-size:13px;"><i class="fa fa-sign-out"></i> 회원목록</a>
	                 </li>                    
	                 <li>
	                       <a href="/logout" style="font-size:13px;"><i class="fa fa-sign-out"></i> 로그아웃</a>
	                 </li>
	       
	            </ul>
                </c:when>
                <c:otherwise>
                <ul id="personal" style="margin-left:800px;">
            
			            <li style="font-size:13px; margin-right:30px; margin-top:2px;" >
			            	${authInfo.name }님
			            </li>

                      <li>
                          <a href="/logout" style="font-size:13px; "><i class="fa fa-sign-out"></i> 로그아웃</a>
                      </li>
                      <li>
                           <a href="/myPost" style="font-size:13px;"> 마이페이지</a>
                      </li>
                      
                 </ul>     
                      
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</c:catch>
                
                
                
           
        </nav>
    </header>
    <div id="header_back">
    </div>
    <section id="container">
        <div id="title">
            <p>자주 묻는 질문</p>
        </div>

        <div id="totalbox">

        

        
            <div class="faq-content">
                <button class="question" id="que-1"><span id="que-3-toggle">Q.</span> <span>로그인할때 비밀번호가 일치하지 않다고 하는데 어떻게 해야 하나요?</span>  </button>
                <div class="answer" id="ans-1"> <span class="ans">A. </span> 아이디와 회원번호가 일치하지 않을 경우 비밀번호 찾기 기능을 이용해주시기 바랍니다.</div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-2"><span id="que-3-toggle">Q.</span> <span>게시판의 글쓰기가 되지 않습니다.</span> </button>
                <div class="answer" id="ans-2"> <span class="ans">A. </span> 트래픽 오류로 인해서 일시적으로 글쓰기가 되지 않을 수 있습니다. 잠시 후에 다시 시도해보시기 바랍니다.</div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-3"><span id="que-3-toggle">Q.</span> <span>글 수정을 하고 싶은데 어떻게 해야 하나요?</span> </button>
                <div class="answer" id="ans-3"> <span class="ans">A. </span> 글 수정은 해당 게시물에 들어간 다음에 수정하기 버튼을 누르면 가능합니다. </div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-4"><span id="que-3-toggle">Q.</span> <span>왈츠장터에서 가격 수정을 하면 오류가 납니다.</span></button>
                <div class="answer" id="ans-4"> <span class="ans">A. </span> 왈츠장터 게시물의 가격 수정은 최대 5회로 제한하고 있습니다. 5회를 초과하여 수정하실 수 없습니다.</div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-5"><span id="que-3-toggle">Q.</span> <span>툴즈에서 나이 측정을 하면 일수가 안나옵니다.</span></button>
                <div class="answer" id="ans-5">  <span class="ans">A. </span> 나이 측정시 0000-00-00의 형식으로 날짜를 입력해주셔야 정확한 일수가 나옵니다.</div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-6"><span id="que-3-toggle">Q.</span> <span>수의사 상담을 받고 싶은데 어떻게 해야하나요?</span></button>
                <div class="answer" id="ans-6"> <span class="ans">A. </span> 수의사 상담은 상단 메뉴의 [진단받기] - [수의사 소개] 를 통해 가능합니다.</div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-7"><span id="que-3-toggle">Q.</span> <span>왈츠 고객센터에 질문을 남겼는데 답변이 오지 않습니다.</span></button>
                <div class="answer" id="ans-7"> <span class="ans">A. </span> 해당 수의사의 스케쥴에 따라 일시적으로 답변이 지연될 수 있습니다. 회원님께서 조금만 더 기다려주시면 감사하겠습니다.</div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-8"><span id="que-3-toggle">Q.</span> <span>회원가입시 이메일 인증을 해도 인증이 되지 않습니다.</span></button>
                <div class="answer" id="ans-8">  <span class="ans">A. </span> 정확한 이메일 주소를 입력하지 않을 경우 이메일 인증이 불가능합니다. 다시 한번 이메일 주소를 확인해주시기 바랍니다.</div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-9"><span id="que-3-toggle">Q.</span> <span>왈츠 회원가입을 위한 기준이 별도로 있나요?</span></button>
                <div class="answer" id="ans-9">  <span class="ans">A. </span>왈츠 회원가입은 누구나 이용이 가능합니다. 단, 회원이 아닐 경우 일부 기능을 사용함에 제한이 있을 수 있습니다.</div>
            </div>
            <div class="faq-content">
                <button class="question" id="que-10"><span id="que-3-toggle">Q.</span> <span>게시물에 사진을 올릴때 사진 크기를 조절할 수 없나요?</span></button>
                <div class="answer" id="ans-10"> <span class="ans">A. </span>사진 크기의 경우 지정된 크기가 있기 때문에 임의로 조절할 수 없습니다.</div>
            </div>
        </div>

        <div id="copyright">
            <div id="copyright_box">
                <div id="copyright_left">
                    <p id="cs">고객센터<br>
                        080. 5498. 4890.<br>
                        waltzadmin@waltz.com</p>
                    <p id="address"> 경기도 수원시 팔달구 매산로 12-1 | 왈츠(주) 
                        <br>등록일자 : 2021년 11월 12일 
                        <br>발행인 : 오일남 | 편집인 : 오일남
                </div>
                <div id="copyright_right">
                    <div id="copyright_right1">
                        <p id="ment">
                            왈츠의 모든 콘텐츠는 저작권법에 의해 보호를 받습니다. <br>
                            무단 복제, 모방 시 법적인 처벌을 받을 수 있습니다.
                        </p> 
                    </div>
                
                    <div id="snslogo">
                        <a href="https://www.facebook.com"><img src="resources/images/facebook.png" alt=""></a>
                        <a href="https://www.instagram.com"><img src="resources/images/instagram.png" alt=""></a>
                        <a href="https://www.youtube.com"><img src="resources/images/youtube.png" alt=""></a>
                    </div>
                </div>     
            </div>
        <hr id="copyright_line">
        <p id="copyright_last">Copyright (c) Waltz 2021, All Rights Reserved</p>
        </div>    

    </section>

    <div id="kakao">
        <img src="resources/images/kakaoimage.png" alt="" id="kakao_logo">
        <div>
            <img src="resources/images/up2.png" style="cursor: pointer;" alt="" id="up" onclick="window.scrollTo(0,0);">
        </div>
        
    </div>


















    

    
    <script src="resources/js/question.js"></script>
</body>
</html>