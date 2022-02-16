<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
   	<title>궁금해요</title>

   	<link rel="stylesheet" href="/resources/css/whywrite.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">

    
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

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
        <div id="title2">
            <p>궁금해요</p>
        </div>
        
        <div>
          <form name="insertForm" action="<c:url value='/board/questionBoardInsert'/>" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="BO_NUM" value="4">
      
               <div style="width:100%; height:70px; margin-left:20px;">
                  <label for="title"></label> 
                  <input type="text" id="title" name="PO_TITLE" style="border: rgb(218, 206, 206) solid 1px;" placeholder="제목을 작성해주세요.">
               </div>
               <div style="width:100%; height:40px; margin-left:20px;">
                  <label for="author"></label> 
                  <input type="text" id="author" name="MEM_ID" style="border: rgb(218, 206, 206) solid 1px;"  readonly value=<c:out value="${authInfo.id}"/>>
               </div>
               
               <div style="margin-left:20px; margin-bottom:10px;">
                  <label for="kind" style="font-weight:700">분류</label> 
                  <select name="INFO_KIND">
                     <option id="kind" value="강아지">강아지</option>
                     <option id="kind" value="고양이">고양이</option>
                     <option id="kind" value="기타">기타</option>
                  </select>
               </div>
               
               <div style="margin-left:20px;">
                  <label for="content"></label>
                  <textarea id="content" name="PO_CONTENT" style="width:980px; height:400px; resize:none; border: rgb(218, 206, 206) solid 1px;"></textarea>
               </div>
               
               
               <div class="form-group" id="file-list" style="width:100%; height:100%; padding-top:30px; padding-bottom:30px; padding-left:30px; ">
                  <a href="#this" class = "fileAdd_btn" style="margin-bottom:20px; text-decoration:none;">파일추가</a>
                  <div class="file-group" style="margin-top:20px;">
                     <input type="file" name="file">
                  </div>
               </div>
         
               <div style="display:inline-flex; width:100%; height:70px; padding-left:380px; ">
                  <button type="button" onclick="insert()" style="width:100px; height:30px; margin-right:30px; background-color: rgb(79, 134, 216); border: none; color: white;">등록하기</button>
                  <button type="button" style="width:100px; height:30px;"  onclick="location.href='<c:url value='/board/questionBoardList?page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'/>'">뒤로가기</button>
                  
                  
               </div>
         </form>      
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













































   
   <script>
      $(document).ready(function(){
         
         addFile();
      })
   
      function insert(){
          var insertForm = document.insertForm;
          var title = insertForm.title.value;
          // var kind = $("#kind option:selected").val();
          var content = insertForm.content.value;
          
          if(!title){
              alert("제목을 입력해주세요.")
          //}else if(!kind){
          //    alert("분류를 선택해주세요.")
          }else if(!content){
              alert("내용을 입력해주세요.")
          }else{
             insertForm.submit();
          }
      }
      
      $(document).ready(function() {
           $("a[name='file-delete']").on("click", function(e) {
               e.preventDefault();
               deleteFile($(this));
           });
       })
    
       // 파일 추가
       function addFile() {
         var fileIndex = 1;
         
         $(".fileAdd_btn").on("click", function(){
              var str = "<div class='file-group'><input type='file' name='file_"+(fileIndex++)+"'><a href='#this' name='file-delete'>삭제</a></div>";
              $("#file-list").append(str);
              $("a[name='file-delete']").on("click", function(e) {
                  e.preventDefault();
                  deleteFile($(this));
              });
         })
            
       }
    
       function deleteFile(obj) {
           obj.parent().remove();
       }
   
   </script>
   
   
   
   
   
   
   
   
   

</body>




</html>