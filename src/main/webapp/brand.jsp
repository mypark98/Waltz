<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>브랜드스토리</title>
    <link rel="stylesheet" href="resources/css/brand.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@400&display=swap" rel="stylesheet">



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
			        <ul id="personal" >
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
			                
			                
			                <ul id="personal" style="margin-left:780px;">
			            
					            <li style="font-size:13px; margin-right:20px; margin-top:2px;">
					            	관리자 ${authInfo.name }
					            </li>
				            		<%-- <h5>관리자 ${authInfo.name }님, 환영합니다.</h5> --%>
				                  
				                 <li>
				                       <a href="/list"><i class="fa fa-sign-out"></i> 회원목록</a>
				                 </li>                    
				                 <li>
				                       <a href="/logout"><i class="fa fa-sign-out"></i> 로그아웃</a>
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
			                           <a href="/myPost"> 마이페이지</a>
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
        <div id="contents">
            <div id="section1_box1">
                <img src="resources/images/brandstory1.jpeg" alt="" >
            </div>
            <div id="section1_back">
                <div id="section1_ment">
                    <span style="font-size: 120px;">Waltz</span> 는 <br> 사람과 반려동물을 위한 <br> 세상을 만들어 나갑니다.
                </div>
            </div>  
        </div>
        <div id="second">
            <div id="section2">
                <div id="section2_ment1">
                    <p>우리들의 이야기가 <br>나와 내 반려동물의 삶을 <br>더욱 즐겁게 할 것을 믿습니다.  </p>

                </div>
                <div id="section2_ment2">
                    <p>왈츠는 반려동물 커뮤니티로<br>반려동물과 사람간의 거리를 좁히고 <br> 모두가 행복할 수 있는 사회를 만들기 위해 <br> 2021년부터 시작되었습니다.  </p>
                </div>
            </div>
        </div>
        <div id="section3">
            <div id="section3_ment1">
                <p><span>커뮤니케이션</span>을 통해 <br>타인과 반려생활에 대한 이야기를 나누고 <br> <span>툴즈</span>를 이용하여 내 반려동물에 <br> 맞는 정보를 알아보세요. <br>
                <span>진단받기</span>에서는 반려동물의 건강상태를 <br>체크할 수 있습니다. </p>

            </div>
            <div id="section3_ment2">
                <p>왈츠의 팀원들은<br>여러분의 반려생활을 <br>정성스럽게 담고자 <br> 최선을 다하고 있습니다.  </p>
            </div>
        </div>

        <div id="section4">
            <div id="section4_comments" style="background-image:url('/resources/images/brandstory_section4.png')">
                <div id="section4_ment_box1">
                    <div class="section4_ment1">
                        <p>Communication</p>
                    </div>
                    <div class="section4_ment2">
                        <p>커뮤니케이션</p>
                    </div>
                    <div class="section4_ment3">
                        <p id="section4_professional">반려동물과 보호자들이 소통할 수 있도록 만든 공간입니다. <br>
				                        자랑하기를 통해 내 반려동물을 자랑하세요.<br>
				                        중고장터에서는 쓰지 않는 애견용품을 사고 팔 수 있습니다. <br>
				                        잃어버린 반려동물이 있다면 찾아주세요를 통해 찾아보세요. 
                        </p>
                    </div>
                    <div class="section4_ment1">
                        <p>Professional</p>
                    </div>
                    <div class="section4_ment2">
                        <p>진단받기</p>
                    </div>
                    <div class="section4_ment3">
                        <p>반려동물의 건강에 이상이 생기거나 <br>더 자세히 알고 싶다면 어떻게 해야 할까요? <br>
				                            마땅한 방법이 떠오르지 않는다면 전문의 코너를 이용해 보세요. <br>
				                            왈츠와 협력하고 있는 전문의들이 <br>여러분의 고민을 들어주기 위해 기다리고 있습니다. <br>
				                            무엇을 해야할지 모르는 당신에게 좋은 해결책이 될 수 있습니다.</p>
                    </div>
                </div>
                <div id="section4_ment_box2">
                    <div class="section4_ment1">
                        <p>Tools</p>
                    </div>
                    <div class="section4_ment2">
                        <p>툴즈</p>
                    </div>
                    <div class="section4_ment3">
                        <p id="section4_tools">내 반려동물에게 알맞은 정보와 행동이 필요하신가요? <br>
						                            툴즈를 이용해보세요. <br>
						                            내 반려동물의 비만도와 나이, 칼로리를 계산할 수 있습니다. <br>
						                            반려동물에 대해 알 수 있는 좋은 기회가 될 겁니다.<br>
						                            궁금증은 반려동물 지식 게시판을 통해 해결할 수 있습니다.</p>
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


</body>
</html>