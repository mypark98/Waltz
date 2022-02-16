<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    
    

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/userview.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">


    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript">
        function goBack() {
            window.history.back();
        }
        
        $(document).ready(function(){
            $("#btnDelete").click(function(){
                if(confirm("탈퇴시키겠습니까?")){
                    document.form1.action = "${path}/expelUser"
                    document.form1.submit();
                }
            })
        })
        
    </script>
    
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
            <ul id="personal" style="margin-left:880px;">
                <li class="login">
                    <a href="/logout" style="font-size:13px;"><i class="fa fa-sign-out"></i>로그아웃</a>
                </li>
                <li class="login">
                     <a href="/myPage" style="font-size:13px;">마이페이지</a>
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

        <div id="id_list">
            <div id="list_box">
                <p>회원정보</p>
                <div id="mypage_box">


                    <form name="form1" method="post">
                        <%-- <table border="1" width="400px">
                            <tr>
                                <td>아이디</td>
                                <td><input name="MEM_ID" VALUE="${vo.MEM_ID}" readonly="readonly"></td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td><input name="MEM_PW" VALUE="${vo.MEM_PW}"></td>
                            </tr>
                            <tr>
                                <td>이름</td>
                                <td><input name="MEM_NAME" VALUE="${vo.MEM_NAME}"></td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td><input name="MEM_EMAIL" VALUE="${vo.MEM_EMAIL}"></td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td><input name="MEM_PHONE" VALUE="${vo.MEM_PHONE}"></td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td><input name="MEM_ADDRESS" VALUE="${vo.MEM_ADDRESS}"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="button" value="회원리스트" onclick="goBack()">
                                    <input type="button" value="탈퇴" id="btnDelete">
                                </td>
                            </tr>
                        </table> --%>
                        
                        <input type="hidden" name="MEM_ID" value="${vo.MEM_ID}">
                        
                        <%-- <div id="info" > 
	                        <div style="display:inline-flex;">
	                        	<p>아이디 :</p> 
	                         	<p id="value_text"  style="margin-left:50px;">${vo.MEM_ID}</p>
	                        </div> 	
                        </div>
                         
                        <div id="info" > 
	                        <div style="display:inline-flex;">
	                        	<p>이름 :</p> 
	                         	<p id="value_text"   style="margin-left:50px;">${vo.MEM_NAME}</p>
	                        </div> 	
                        </div>
                        <div id="info" > 
	                        <div style="display:inline-flex;">
	                        	<p>이메일 :</p> 
	                         	<p id="value_text"  style="margin-left:50px;">${vo.MEM_EMAIL}</p>
	                        </div> 	
                        </div>
                        <div id="info" > 
	                        <div style="display:inline-flex;">
	                        	<p>전화번호 :</p> 
	                         	<p id="value_text"  style="margin-left:50px;">${vo.MEM_PHONE}</p>
	                        </div> 	
                        </div>
                        <div id="info" > 
	                        <div style="display:inline-flex;">
	                        	<p>주소 :</p> 
	                         	<p id="value_text"  style="margin-left:50px;">${vo.MEM_ADDRESS}</p>
	                        </div> 	
                        </div> --%>
                        
                        <table border="1" style="margin-left:190px; margin-top:100px; border-collapse:collapse; width:400px; height:250px; font-size:20px; text-align:center;">
                        	<tr>
                        		<td style="font-weight:700;" >아이디</td>
                        		<td>${vo.MEM_ID}</td>
                        	</tr>
                        	<tr>
                        		<td style="font-weight:700;">이름</td>
                        		<td>${vo.MEM_NAME}</td>
                        	</tr>
                        	<tr>
                        		<td style="font-weight:700;">이메일</td>
                        		<td>${vo.MEM_EMAIL}</td>
                        	</tr>
                        	<tr>
                        		<td style="font-weight:700;">전화번호</td>
                        		<td>${vo.MEM_PHONE}</td>
                        	</tr>
                        	<tr>
                        		<td style="font-weight:700;">주소</td>
                        		<td>${vo.MEM_ADDRESS} </td>
                        	</tr>
                        	<tr>
                        		<td style="font-weight:700;">상세주소</td>
                        		<td>${vo.MEM_DETAILADDRESS} </td>
                        	</tr>
                        
                        </table>
                        
                        <div id=btn_box style="margin-left:300px;">
	                        <input type="button" value="회원리스트" id="personList" onclick="goBack()">
	                        <input type="button" value="탈퇴" id="btnDelete">
                        </div>
                        
                       
                    </form>





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
        <img src="/resources/images/kakaoimage.png" alt="" id="kakao_logo">
        <div>
            <img src="/resources/images/up2.png" style="cursor: pointer;" alt="" id="up" onclick="window.scrollTo(0,0);">
        </div>
        
    </div>

    
    
</body>
</html>