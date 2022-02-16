<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<!DOCTYPE html>
	<html>
	<head>
    <meta charset="UTF-8">
    
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="/resources/js/addressapi.js"></script>
    <title>회원가입</title>
   
   <link rel="stylesheet" href="../../resources/css/signup.css?after" type="text/css">

    <script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#submitBtn").on("click", function(){
				if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#confirmPassword").val()==""){
					alert("확인 비밀번호를 입력해주세요.");
					$("#confirmPassword").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
				if($("#phone").val()==""){
		            alert("전화번호를 입력해주세요.");
		            $("#phone").focus();
		            return false;
		        }
		         if($("#address").val()==""){
		               alert("주소를 입력해주세요.");
		               $("#address").focus();
		               return false;
		            }
		            if($("#detailAddress").val()==""){
		               alert("상세주소를 입력해주세요.");
		               $("#detailAddress").focus();
		               return false;
		            }
				
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			
			if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			
			$.ajax({
				url : "/idChk",
				type : "post",
				dataType : "json",
				data : {"MEM_ID" : $("#id").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>

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
                        <a href="/"><img src="/resources/images/logo.png" alt=""></a>
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
            <ul id="personal">
                <li class="login">
                    <a href="/login">로그인</a> 
                </li>
                <li class="login">
                    <a href="/register/step1">회원가입</a>
                </li>
            </ul>
        </nav>
    </header>
    <div id="header_back">
    </div>
    <section id="container">
        <div id="title">
            <div>
                <p>회원가입</p>
            </div>
            <!-- <img src="../image/logo.png" alt=""> -->
            
        </div>

        

        


           <div class="panel-body" id="panel-body">
            <div class="row" id="row">
                <div class="col-lg-6">
                     	<form:form role="form" commandName="registerRequest" action="/register/step3" method="POST" id="regForm">
		                	<div>
		                    	<form:input type="text" class="form-control" placeholder="아이디" path="id" id="id"/>
		                    	<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
		               		</div>
		               	 	<div>
		                    	<form:password placeholder="비밀번호" path="password" id="password"/>
		                    	<form:errors path="password"/>
		                	</div>
		                	<div>
		                    	<form:password placeholder="비밀번호 확인" path="confirmPassword" id="confirmPassword"/>
		                    	<form:errors path="confirmPassword"/>
		                	</div>
		                	<div>
		                    	<form:input type="text" placeholder="이름" path="name" id="name"/>
		                    	<form:errors path="name"/>
		                	</div>
			                <div>
			                    <form:input type="text" placeholder="이메일" path="email" id="email"/>
			                    <form:errors path="email"/>                   
			                </div>
			                <div>
			                    <form:input type="tel" placeholder="전화번호" path="phone" id="phone"/>                   
			                </div>
			                <div>
			                    <form:input type="text" placeholder="주소" path="address" id="address"/>                   
			                </div>
			               <div>
			                    <form:input type="text" placeholder="상세주소" path="detailAddress" id="detailAddress"/>                   
			                </div>
                
            		<input type="hidden" value="0" name="manager">
            
	            <br>
	
	               <button class="btn btn-success" type="button" id="submitBtn">회원가입</button>
	               <button class="cencle btn btn-danger" type="button" id="cancelBtn">취소</button>
            </form:form>
                </div>
            </div>
        </div>
        
            
       
        

        <div id="copyright">
            <div id="copyright_box">
                <div id="copyright_left">
                    <p id="cs">고객센터<br>
                        080. 5498. 4890.<br>
                        waltzadmin@waltz.com</p>
                    <p id="address" style="border:none;"> 경기도 수원시 팔달구 매산로 12-1 | 왈츠(주) 
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
                        <a href="https://www.facebook.com"><img src="/resources/images/facebook.png" alt=""></a>
                        <a href="https://www.instagram.com"><img src="/resources/images/instagram.png" alt=""></a>
                        <a href="https://www.youtube.com"><img src="/resources/images/youtube.png" alt=""></a>
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
         document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                document.querySelector("input[name=detailAddress]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}







</script>

    
        
    
    
</body>
</html>