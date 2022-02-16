<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/mypage.css">

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
                        <a href="#" >커뮤니케이션</a> 
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
            <ul id="personal" style="margin-left:800px;">
            
			            <li style="font-size:13px; margin-right:30px; margin-top:2px;" >
			            	${authInfo.name}님
			            </li>

                      <li>
                          <a href="/logout" style="font-size:13px;"><i class="fa fa-sign-out"></i>로그아웃</a>
                      </li>
                      <li>
                           <a href="/myPost" style="font-size:13px;">마이페이지</a>
                      </li>
                      
                 </ul> 
        </nav>
    </header>
    <div id="header_back">
    </div>
    <section id="container">
        <div id="title">
            
            <!-- <img src="../image/logo.png" alt=""> -->
            
        </div>

        

        <div id="mypage">
            <div id="mypage_title">
                
            </div>
            <div id="mypage_contents">
                <div id="mypage_up">
                    <div id="mypage_up_detail">
                        <div>
                            <p id="mypage_ment">마이페이지</p>
                        </div>
                        <div id="welcome_box">
                            <p id="welcome">${authInfo.name}님 환영합니다.</p>
                        </div>
                        <div id="buttons">
                            <button> <a href="/modifyPwdChk"> 회원정보 변경</a> </button>
                            <button id="out"> <a href="/delete"> 회원탈퇴</a></button>
                        </div>
                        
                    </div>
                    <div id="mypage_box">
                        <div id="mypage_personal">
                            <p>이름 : ${authInfo.name}</p>
                            <p>전화번호 : ${authInfo.phone}</p>
                            <p>주소 : ${authInfo.address} ${authInfo.detailAddress} </p>
                            <p>이메일 : ${authInfo.email } </p>
                        </div>
                       
                        
                        <div id="mypage_pet">
                            <div id="mypage_pet_title">
                                <p id="mypet">내 반려동물</p>
                                <button id="regist"> <a href="/petRegister">등록</a> </button>
                            </div>
                            
                            <div>
                            <c:if test="${petInfo.ANI_FILENAME != null}">
                                <div id="uploadResult">
							         <img src="display?fileName=${petInfo.ANI_UPLOADPATH}/s_${petInfo.ANI_UUID}_${petInfo.ANI_FILENAME}">
							      </div>
							      </c:if>
							      
							       <c:if test="${petInfo.ANI_FILENAME == null}">
   										<img src="resources/images/pet_sample.png">
   									</c:if>
							      
							      
							      
                                <div id="info_box">
                                    <div id="mypage_info_detail">
                                        <p>이름 : ${petInfo.ANI_NAME} </p>
                                        <p>성별 : ${petInfo.ANI_GENDER}</p>
                                        <p>분류 : ${petInfo.ANI_KIND}</p>
                                        <p>품종 : ${petInfo.ANI_TYPE}</p>
                                        <p>중성화 여부 : ${petInfo.ANI_NEUTERING}</p>
                                        <p>몸무게 : ${petInfo.ANI_WEIGHT}</p>
                                        <p>과거병력 : ${petInfo.ANI_MEDICALHIS}</p> 
                                        
                                    </div>
                                    
                                </div>    
                            </div>    
                        </div>
                        <div id="mypage_pet2">
                            <p id="mypet">내가 쓴 글</p>
                            	<div id="write_list" >
									<table border="1">
								        	<tr>
								        		<th id="th1">게시판</th>
								        		<th id="th2">제목</th>
								        		<th id="th3">날짜</th>
								        		<th id="th4">조회수</th>
								        	</tr>

								         <c:forEach items="${userInfo}" var="ab">
								         
								            <c:if test="${ab.BO_NUM == 1}">
								                 
								                <tr> 
								                	<td>자랑하기</td>              <!-- 게시판 이름 -->
								                  <td>${ab.PO_TITLE} </td>           <!-- 게시글 제목 -->
								                  <td><fmt:formatDate value="${ab.PO_DATE}" pattern="yyyy-MM-dd"/></td>           <!-- 게시글 올린 날짜 -->
								                  <td>${ab.PO_CLICKS}  </td>
												</tr>          <!-- 조회수 -->
								              
								            </c:if>   
								         
								            <c:if test="${ab.BO_NUM == 4}">
								                <tr>
								                  		<td>반려동물 지식</td>             <!-- 게시판 이름 -->
								                  <td>${ab.PO_TITLE} </td>            <!-- 게시글 제목 -->
								                  <td><fmt:formatDate value="${ab.PO_DATE}" pattern="yyyy-MM-dd"/> </td>            <!-- 게시글 올린 날짜 -->
								                  <td>${ab.PO_CLICKS} </td>            <!-- 조회수 -->
								               </tr>
								            </c:if>   
								            
								            <c:if test="${ab.BO_NUM == 5}">
								                 <tr> 
								                  <td>1:1 질문하기</td>         <!-- 게시판 이름 -->
								                  <td>${ab.PO_TITLE}</td>            <!-- 게시글 제목 -->
								                  <td><fmt:formatDate value="${ab.PO_DATE}" pattern="yyyy-MM-dd"/></td>           <!-- 게시글 올린 날짜 -->
								                  <td>${ab.PO_CLICKS}</td>           <!-- 조회수 -->
								               </tr>
								            </c:if>      
								                              
								         </c:forEach>    
								         
								    </table>                           
                            	</div>
                            
                        </div>
                    </div>
                </div>
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
ㄴ
</body>
</html>