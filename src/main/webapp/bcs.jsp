<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비만도 계산</title>
    <link rel="stylesheet" href="/resources/css/bcs.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

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
                        <a href="">커뮤니케이션</a> 
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
        
        <div id="age_ment">
            <img src="resources/images/bcs.png" alt="">
            <p id="p1">비만도 계산하기</p>
            <p id="p2">우리 아이의 비만도를 <br>
                		시각적으로 볼 수 있는 도구입니다.</p>
        </div>

        <div id="big">
            
                <div class="dogcat" >
                    <p>반려동물 선택</p>
                    <img src="resources/images/button_dog.png" class="dog" onclick="test1()" >
                    <img src="resources/images/button_cat.png" class="cat" onclick="test2()">
                </div>
                
            
            <div id="age_box1">
                
                
                    <p>체형을 선택하세요.</p>
                    <div id="type_input">

                        

                        <img src="resources/images/dog_bcs1.png" class="dog_type" id="dog1" alt="" value="dog1" onclick="dogselect1()">
                        <img src="resources/images/dog_bcs2.png" class="dog_type" id="dog2" alt="" value="dog2" onclick="dogselect2()">
                        <img src="resources/images/dog_bcs3.png" class="dog_type" id="dog3" alt="" value="dog3" onclick="dogselect3()">
                        <img src="resources/images/dog_bcs4.png" class="dog_type" id="dog4" alt="" value="dog4" onclick="dogselect4()">
                        <img src="resources/images/dog_bcs5.png" class="dog_type" id="dog5" alt="" value="dog5" onclick="dogselect5()">
                    </div>
                    
                    
                        
                    <div id="result">
                        <p id="result_text1"> </p>
                    </div>
                
                <div id="age_box2">   
                   
                        <p>체형을 선택하세요.</p>
                        <div id="type_input">
                            <img src="resources/images/cat_bcs1.png" class="cat_type" id="cat1"  value="cat1" onclick="catselect1()">
                            <img src="resources/images/cat_bcs2.png" class="cat_type" id="cat2"  value="cat2" onclick="catselect2()">
                            <img src="resources/images/cat_bcs3.png" class="cat_type" id="cat3"  value="cat3" onclick="catselect3()">
                            <img src="resources/images/cat_bcs4.png" class="cat_type" id="cat4"  value="cat4" onclick="catselect4()">
                            <img src="resources/images/cat_bcs5.png" class="cat_type" id="cat5"  value="cat5" onclick="catselect5()">
                        </div>
                        
                        <div id="result">
                            <p id="result_text2"> </p>
                        </div>        
                </div>      
        </div>

        <div id="copyright"  >
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

    
    
    <script src="/resources/js/bcs.js"  charset="UTF-8"></script>

</body>
</html>