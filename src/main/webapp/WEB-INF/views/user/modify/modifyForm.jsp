<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="/resources/css/idchange.css" type="text/css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    <script type="text/javascript">
    $(document).ready(function(){
        
        $(".cencle").on("click", function(){
            
            location.href = "/";
                        
        })
    
        $("#submitBtn").on("click", function(){
            if($("#MEM_PW").val()==""){
                alert("비밀번호를 입력해주세요.");
                $("#MEM_PW").focus();
                return false;
            }
            
            
            if($("#MEM_NAME").val()==""){
                alert("성명을 입력해주세요.");
                $("#MEM_NAME").focus();
                return false;
            }
            
            if($("#MEM_PHONE").val()==""){
                alert("전화번호를 입력해주세요.");
                $("#MEM_PHONE").focus();
                return false;
            }
            
            if($("#MEM_ADDRESS").val()==""){
                alert("주소를 입력해주세요.");
                $("#MEM_ADDRESS").focus();
                return false;
            }
            
            if($("#MEM_DETAILADDRESS").val()==""){
                alert("상세주소를 입력해주세요.");
                $("#MEM_DETAILADDRESS").focus();
                return false;
            }
            
            

            
            alert("회원정보 수정이 완료되었습니다. \n다시 로그인해주세요.");
        });
            
    })
    </script>
    </script>
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
                           <a href="/myPage" style="font-size:13px;">마이페이지</a>
                      </li>
                      
                 </ul> 
        </nav>
    </header>
    <div id="header_back">
    </div>
    <section id="container">
        <div id="title">
            
            <!-- <img src="/resources/images/logo.png" alt=""> -->
            
        </div>
        <div id="mypage">
            <div id="mypage_title">
                
            </div>
            <div id="mypage_contents">
            	
            	<p id="modify_title">회원정보 수정</p>

                <form id="updateForm" action="/modify" method="POST" >
			
                    <div id="id">
                        <label for="MEM_ID"  >아이디</label> <br>
                        <input class="form-control" type="text" id="MEM_ID" name="MEM_ID" value="${authInfo.id}" readonly="readonly"/>
                    </div>
                    <div  id="pwd">
                        <label for="MEM_PW">패스워드</label> <br>
                        <input type="password" id="MEM_PW" name="MEM_PW" />
                    </div>
                    <div id="name">
                        <label for="MEM_NAME" >성명</label> <br>
                        <input type="text" id="MEM_NAME" name="MEM_NAME" />
                    </div>
                    <div id="phone">
                        <label for="MEM_PHONE" >전화번호</label> <br>
                        <input type="tel" id="MEM_PHONE" name="MEM_PHONE" />
                    </div>
                    <div  id="address">
                        <label for="MEM_ADDRESS">주소</label> <br>
                        <input type="text" id="MEM_ADDRESS" name="MEM_ADDRESS" />
                    </div>
                    <div id="detailaddress">
                        <label for="MEM_DETAILADDRESS" >상세주소</label> <br>
                        <input type="text" id="MEM_DETAILADDRESS" name="MEM_DETAILADDRESS" style="" />
                    </div>
                   
                    
                    
                    
                    <br>
                    <div id="btnBox">
                        <button class="btn btn-success" type="submit" id="submitBtn">수정</button>
                        <button class="cencle btn btn-danger" id="cancelBtn" type="button" style="cursor:pointer">취소</button>
                    </div>
                    
                </form>

                <div>
                    <c:if test="${msg == false}">
                      	  비밀번호가 맞지 않습니다.
                    </c:if>
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
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
        window.onload = function(){
         document.getElementById("MEM_ADDRESS").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("MEM_ADDRESS").value = data.address; // 주소 넣기
                document.querySelector("input[name=MEM_DETAILADDRESS]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

</script>

    
</body>
</html>