<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waltz에 오신 것을 환영합니다.</title>
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">


    
    <style>
        .swiper {
          width: 100%;
          height: 100%; 
        }
        .swiper-slide {
          text-align: center;
          font-size: 18px;
          background: #fff;
  
          /* Center slide text vertically */
          display: -webkit-box;
          display: -ms-flexbox;
          display: -webkit-flex;
          display: flex;
          -webkit-box-pack: center;
          -ms-flex-pack: center;
          -webkit-justify-content: center;
          justify-content: center;
          -webkit-box-align: center;
          -ms-flex-align: center;
          -webkit-align-items: center;
          align-items: center;
        }
  
        .swiper-slide img {
          display: block;
          width: 100%;
          height: 100%;
          object-fit: cover;
        }
  
        .swiper {
          margin-left: auto;
          margin-right: auto;
        }

        .swiper-pagination-bullet { 
            width: 12px; 
            height: 12px; 
            background: transparent; 
            border: 1px solid rgb(130, 194, 255); 
            opacity: 1; 
        }

        .swiper-pagination-bullet-active { width: 40px; 
            transition: width .5s; 
            border-radius: 5px; 
            background: rgb(130, 194, 255); 
            border: 1px solid transparent; 
        }
      </style>

</head>
<body>

<c:catch>
    <c:choose>
        <c:when test="${empty authInfo }">
        
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
                        <!-- <a href="../html/find.html">찾아주세요</a> -->
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
            
            
            <ul id="personal">
                <li>
                 	<a href="/login"><i class="fa fa-sign-in"></i> 로그인</a>
	            </li>
	            <li>
	                <a href="/register/step1"><i class="fa fa-user"></i> 회원가입</a>
	            </li>
            </ul>
            
            
        </nav>
    </header>
    <div id="header_back">
    </div>
    <section id="container">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div id="swiper_backcolor1">
                        <p id="text1">내 반려동물<br>예쁘게 키우기</p>
                        <!-- <img src="../image/main_pic1.png" alt=""> -->
                        <p id="text2">반려동물을 위한 당신의 선택, 왈츠</p>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor2">
                        <p id="text1">유기동물<br> 보호 캠페인</p>
                        <!-- <img src="../image/main2.jpeg" alt=""> -->
                        <p id="text2">왈츠는 고통받는 반려동물이 없는<br>세상을 만들어 나갑니다.</p>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor3">
                        <div id="ment_box">
                            <p id="text1">사이좋은 관계 만들기 </p>
                        <!-- <img src="../image/main3.jpeg" alt=""> -->
                            <p id="text2">반려동물에 대한 관심은<br>화목한 라이프를 형성합니다.</p>
                        </div>
                        
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor4">
                        <div id="ment_box2">
                            <p id="text1">반려동물 보호자<br>철저히 준비하기 </p>
                            <!-- <img src="../image/main4.png" alt=""> -->
                            <p id="text2">꼼꼼한 준비가 즐거운 반려생활을 만듭니다.</p>
                        </div>
                    </div>
                </div>
            </div>
                <div class="swiper-button-next" id="button1"></div>
                <div class="swiper-button-prev" id="button2"></div>
                <div class="swiper-pagination" id="paging"></div>
            </div>
            <div id="knowledge">
                <div id="knowledge_title">
                    <p>반려동물 지식</p>
                </div>
                <div class="knowledge_section">
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_1.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>귀여운 강아지가 좋아하는 행동 5가지</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_2.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>어린 고양이 키우는 꿀팁</p>
                            </div>
                        </div>
                    </a>
                   
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_3.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>우리 고양이 이빨 닦기</p>
                            </div>
                        </div>
                    </a>
                    
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_4.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>하루종일 산책가자고 조르는<br>강아지 다루는 법</p>
                            </div>
                        </div>
                    </a>
                    
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_5.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>무더운 여름을 나기 위해 주인이 꼭 해야할 일</p>
                            </div>
                        </div>
                    </a>
                    
                </div>
                <div class="knowledge_section">
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_6.png" alt="">
                            <div class="knowledge_ment">
                                <p>말 안듣는 강아지 훈육 꿀팁 5가지</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_7.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>고양이는 산책을 안나가도 괜찮을까?</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_8.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>강아지 손주는 훈련하기</p>
                            </div>
                        </div>
                    </a>
                   
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_9.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>배변 못가리는 강아지를 위한 3가지 방법</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_10.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>절대 만지지 말아야 할 고양이 부위 </p>
                            </div>
                        </div>
                    </a>
                   
                </div>
            </div>
            <div id="introduce">

                <div id="introduce_contents">
                    <div>
                        <img src="resources/images/main_sky.png" alt="">
                    </div>
                    <div id="ment1">
                        <p>반려동물과 함께하는<br>마이펫 라이프.</p>
                    </div>
                    <div id="ment2">
                        <p>왈츠는 회원님과 반려견의 행복한 삶을 추구합니다. <br>
				                            강아지와 고양이의 모든 것을 왈츠를 통해 얻어가세요. <br>
				                            당신의 삶의 유익한 존재가 되겠습니다.</p>
                    </div>
                </div>


            </div>
            <div id="function">
                <div id="function_title">
                    <p>About Waltz</p>
                </div>
                <div id="function_section">
                    <div class="function_detail">
                        <p>커뮤니케이션</p>
                        <img src="resources/images/function1.jpeg" alt="">
                        <p id="context">다른 사람들과 함께<br> 반려동물에 대한 이야기를<br> 나누세요.</p>
                    </div>
                    <div class="function_detail">
                        <p>툴즈</p>
                        <img src="resources/images/function2.jpeg" alt="">
                        <p id="context">반려동물의 나이와 칼로리,<br>비만도를 계산할 수 있습니다.</p>
                    </div>
                    <div class="function_detail">
                        <p>진단받기</p>
                        <img src="resources/images/function3.jpeg" alt="">
                        <p id="context">내 반려동물의 건강상태를<br>전문의와 상의하세요.</p>
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
        </div>    
    </section>

    <div id="kakao">
        <img src="resources/images/kakaoimage.png" alt="" id="kakao_logo">
        <div>
            <img src="resources/images/up2.png" style="cursor: pointer;" alt="" id="up" onclick="window.scrollTo(0,0);">
        </div>
        
    </div>

    <script src="/resources/js/index.js"></script>
        
        
        
        
            <!-- <li>
                 <a href="/login"><i class="fa fa-sign-in"></i> 로그인</a>
             </li>
             <li>
                 <a href="/register/step1"><i class="fa fa-user"></i> 회원가입</a>
             </li>
             <li>
                 <a href="/board/questionBoardList"> 게시판</a>
             </li> -->
             
             
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${authInfo.manager eq '1' }">
                
                
               
                
                
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
            <ul id="personal" style="margin-left:780px;">
            
	            <li style="font-size:13px; margin-right:20px;">
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
        </nav>
    </header>
    <div id="header_back">
    </div>
    <section id="container">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div id="swiper_backcolor1">
                        <p id="text1">내 반려동물<br>예쁘게 키우기</p>
                        <!-- <img src="../image/main_pic1.png" alt=""> -->
                        <p id="text2">반려동물을 위한 당신의 선택, 왈츠</p>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor2">
                        <p id="text1">유기동물<br> 보호 캠페인</p>
                        <!-- <img src="../image/main2.jpeg" alt=""> -->
                        <p id="text2">왈츠는 고통받는 반려동물이 없는<br>세상을 만들어 나갑니다.</p>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor3">
                        <div id="ment_box">
                            <p id="text1">사이좋은 관계 만들기 </p>
                        <!-- <img src="../image/main3.jpeg" alt=""> -->
                            <p id="text2">반려동물에 대한 관심은<br>화목한 라이프를 형성합니다.</p>
                        </div>
                        
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor4">
                        <div id="ment_box2">
                            <p id="text1">반려동물 보호자<br>철저히 준비하기 </p>
                            <!-- <img src="../image/main4.png" alt=""> -->
                            <p id="text2">꼼꼼한 준비가 즐거운 반려생활을 만듭니다.</p>
                        </div>
                    </div>
                </div>
            </div>
                <div class="swiper-button-next" id="button1"></div>
                <div class="swiper-button-prev" id="button2"></div>
                <div class="swiper-pagination" id="paging"></div>
            </div>
            <div id="knowledge">
                <div id="knowledge_title">
                    <p>반려동물 지식</p>
                </div>
                <div class="knowledge_section">
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_1.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>귀여운 강아지가 좋아하는 행동 5가지</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_2.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>어린 고양이 키우는 꿀팁</p>
                            </div>
                        </div>
                    </a>
                   
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_3.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>우리 고양이 이빨 닦기</p>
                            </div>
                        </div>
                    </a>
                    
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_4.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>하루종일 산책가자고 조르는<br>강아지 다루는 법</p>
                            </div>
                        </div>
                    </a>
                    
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_5.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>무더운 여름을 나기 위해 주인이 꼭 해야할 일</p>
                            </div>
                        </div>
                    </a>
                    
                </div>
                <div class="knowledge_section">
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_6.png" alt="">
                            <div class="knowledge_ment">
                                <p>말 안듣는 강아지 훈육 꿀팁 5가지</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_7.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>고양이는 산책을 안나가도 괜찮을까?</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_8.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>강아지 손주는 훈련하기</p>
                            </div>
                        </div>
                    </a>
                   
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_9.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>배변 못가리는 강아지를 위한 3가지 방법</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_10.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>절대 만지지 말아야 할 고양이 부위 </p>
                            </div>
                        </div>
                    </a>
                   
                </div>
            </div>
            <div id="introduce">

                <div id="introduce_contents">
                    <div>
                        <img src="resources/images/main_sky.png" alt="">
                    </div>
                    <div id="ment1">
                        <p>반려동물과 함께하는<br>마이펫 라이프.</p>
                    </div>
                    <div id="ment2">
                        <p>왈츠는 회원님과 반려견의 행복한 삶을 추구합니다. <br>
				                            강아지와 고양이의 모든 것을 왈츠를 통해 얻어가세요. <br>
				                            당신의 삶의 유익한 존재가 되겠습니다.</p>
                    </div>
                </div>


            </div>
            <div id="function">
                <div id="function_title">
                    <p>About Waltz</p>
                </div>
                <div id="function_section">
                    <div class="function_detail">
                        <p>커뮤니케이션</p>
                        <img src="resources/images/function1.jpeg" alt="">
                        <p id="context">다른 사람들과 함께<br> 반려동물에 대한 이야기를<br> 나누세요.</p>
                    </div>
                    <div class="function_detail">
                        <p>툴즈</p>
                        <img src="resources/images/function2.jpeg" alt="">
                        <p id="context">반려동물의 나이와 칼로리,<br>비만도를 계산할 수 있습니다.</p>
                    </div>
                    <div class="function_detail">
                        <p>진단받기</p>
                        <img src="resources/images/function3.jpeg" alt="">
                        <p id="context">내 반려동물의 건강상태를<br>전문의와 상의하세요.</p>
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
        </div>    
    </section>

    <div id="kakao">
        <img src="resources/images/kakaoimage.png" alt="" id="kakao_logo">
        <div>
            <img src="resources/images/up2.png" style="cursor: pointer;" alt="" id="up" onclick="window.scrollTo(0,0);">
        </div>
        
    </div>

    <script src="/resources/js/index.js"></script>
                
                
                
                
                
                </c:when>
                <c:otherwise>
                
                
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
            <ul id="personal" style="margin-left:800px;">
            
			            <li style="font-size:13px; margin-right:30px;" >
			            	${authInfo.name }님
			            </li>
            
            		<%-- <h5>${authInfo.name }님</h5>
 --%>
                      <li>
                          <a href="/logout" style="font-size:13px; "><i class="fa fa-sign-out"></i> 로그아웃</a>
                      </li>
                      <li>
                           <a href="/myPost"> 마이페이지</a>
                      </li>
            
                <!-- <li>
                 	<a href="/login"><i class="fa fa-sign-in"></i> 로그인</a>
	            </li>
	            <li>
	                <a href="/register/step1"><i class="fa fa-user"></i> 회원가입</a>
	            </li> -->
	            
	            
	            
            
            </ul>
        </nav>
    </header>
    <div id="header_back">
    </div>
    <section id="container">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div id="swiper_backcolor1">
                        <p id="text1">내 반려동물<br>예쁘게 키우기</p>
                        <!-- <img src="../image/main_pic1.png" alt=""> -->
                        <p id="text2">반려동물을 위한 당신의 선택, 왈츠</p>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor2">
                        <p id="text1">유기동물<br> 보호 캠페인</p>
                        <!-- <img src="../image/main2.jpeg" alt=""> -->
                        <p id="text2">왈츠는 고통받는 반려동물이 없는<br>세상을 만들어 나갑니다.</p>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor3">
                        <div id="ment_box">
                            <p id="text1">사이좋은 관계 만들기 </p>
                        <!-- <img src="../image/main3.jpeg" alt=""> -->
                            <p id="text2">반려동물에 대한 관심은<br>화목한 라이프를 형성합니다.</p>
                        </div>
                        
                    </div>
                </div>
                <div class="swiper-slide">
                    <div id="swiper_backcolor4">
                        <div id="ment_box2">
                            <p id="text1">반려동물 보호자<br>철저히 준비하기 </p>
                            <!-- <img src="../image/main4.png" alt=""> -->
                            <p id="text2">꼼꼼한 준비가 즐거운 반려생활을 만듭니다.</p>
                        </div>
                    </div>
                </div>
            </div>
                <div class="swiper-button-next" id="button1"></div>
                <div class="swiper-button-prev" id="button2"></div>
                <div class="swiper-pagination" id="paging"></div>
            </div>
            <div id="knowledge">
                <div id="knowledge_title">
                    <p>반려동물 지식</p>
                </div>
                <div class="knowledge_section">
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_1.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>귀여운 강아지가 좋아하는 행동 5가지</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_2.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>어린 고양이 키우는 꿀팁</p>
                            </div>
                        </div>
                    </a>
                   
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_3.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>우리 고양이 이빨 닦기</p>
                            </div>
                        </div>
                    </a>
                    
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_4.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>하루종일 산책가자고 조르는<br>강아지 다루는 법</p>
                            </div>
                        </div>
                    </a>
                    
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_5.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>무더운 여름을 나기 위해 주인이 꼭 해야할 일</p>
                            </div>
                        </div>
                    </a>
                    
                </div>
                <div class="knowledge_section">
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_6.png" alt="">
                            <div class="knowledge_ment">
                                <p>말 안듣는 강아지 훈육 꿀팁 5가지</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_7.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>고양이는 산책을 안나가도 괜찮을까?</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_8.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>강아지 손주는 훈련하기</p>
                            </div>
                        </div>
                    </a>
                   
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_9.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>배변 못가리는 강아지를 위한 3가지 방법</p>
                            </div>
                        </div>
                    </a>
                    <a href="">
                        <div id="knowledge_content">
                            <img src="resources/images/knowledge_10.jpeg" alt="">
                            <div class="knowledge_ment">
                                <p>절대 만지지 말아야 할 고양이 부위 </p>
                            </div>
                        </div>
                    </a>
                   
                </div>
            </div>
            <div id="introduce">

                <div id="introduce_contents">
                    <div>
                        <img src="resources/images/main_sky.png" alt="">
                    </div>
                    <div id="ment1">
                        <p>반려동물과 함께하는<br>마이펫 라이프.</p>
                    </div>
                    <div id="ment2">
                        <p>왈츠는 회원님과 반려견의 행복한 삶을 추구합니다. <br>
				                            강아지와 고양이의 모든 것을 왈츠를 통해 얻어가세요. <br>
				                            당신의 삶의 유익한 존재가 되겠습니다.</p>
                    </div>
                </div>


            </div>
            <div id="function">
                <div id="function_title">
                    <p>About Waltz</p>
                </div>
                <div id="function_section">
                    <div class="function_detail">
                        <p>커뮤니케이션</p>
                        <img src="resources/images/function1.jpeg" alt="">
                        <p id="context">다른 사람들과 함께<br> 반려동물에 대한 이야기를<br> 나누세요.</p>
                    </div>
                    <div class="function_detail">
                        <p>툴즈</p>
                        <img src="resources/images/function2.jpeg" alt="">
                        <p id="context">반려동물의 나이와 칼로리,<br>비만도를 계산할 수 있습니다.</p>
                    </div>
                    <div class="function_detail">
                        <p>진단받기</p>
                        <img src="resources/images/function3.jpeg" alt="">
                        <p id="context">내 반려동물의 건강상태를<br>전문의와 상의하세요.</p>
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
        </div>    
    </section>

    <div id="kakao">
        <img src="resources/images/kakaoimage.png" alt="" id="kakao_logo">
        <div>
            <img src="resources/images/up2.png" style="cursor: pointer;" alt="" id="up" onclick="window.scrollTo(0,0);">
        </div>
        
    </div>

    <script src="/resources/js/index.js"></script>
                
                
                
                
                  
                      
                      
                      
                      
                      
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</c:catch>




</body>
</html>
