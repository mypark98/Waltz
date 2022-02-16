<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
      
   	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>궁금해요</title>
    
    <link rel="stylesheet" href="/resources/css/questionBoardUpdate.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">

    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   
</head>



<script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='updateForm']");
         
         $(document).on("click","#fileDel", function(){
            $(this).parent().remove();
         })
         
         fn_addFile();
         
         $(".cancel_btn").on("click", function(){
            event.preventDefault();
            self.location = "/board/questionBoardDetail?"
                 + "PO_NUM=${detail.PO_NUM}"
                 + "&BO_NUM=4"
                  + "&page=${scri.page}&perPageNum=${scri.perPageNum}"
                  + "&searchType=${scri.searchType}&keyword=${scri.keyword}";
         })
         
         // 글 수정 submit
         $(".update_btn").on("click", function(){
            if(fn_valiChk()){
               return false;
            }
            formObj.attr("action", "/board/questionBoardUpdate");
            formObj.attr("method", "POST");
            formObj.submit();
         })
      })
      
      //벨리데이션 체크
      function fn_valiChk(){
         var updateForm = $("form[name='updateForm'] .chk").length;
         for(var i = 0; i<updateForm; i++){
            if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
               alert($(".chk").eq(i).attr("PO_TITLE"));
               return true;
            }
         }
      }
      
      // 파일 추가
      function fn_addFile(){
         var fileIndex = 1;
        
         $(".fileAdd_btn").on("click", function(){
            $("#fileIndex").append("<div><input type='file' style='margin-bottom:5px;' name='file_"+(fileIndex++)+"'>"
            +"</button>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");
            
         });
         
         $(document).on("click","#fileDelBtn", function(){
             $(this).parent().remove();
             
          });

       }
      
       var fileNoArry = new Array();
       var fileNameArry = new Array();
       
       // 삭제
       function fn_del(value, name){
          
          fileNoArry.push(value);
          fileNameArry.push(name);
          $("#fileNoDel").attr("value", fileNoArry);
          $("#fileNameDel").attr("value", fileNameArry);
       }
       
   </script>
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
        <div id="title" style="padding-top:50px; margin-bottom:50px; font-size:20px; font-weight:700;">
            <p>궁금해요</p>
        </div>
        
        
        <div id="boast_update_box">      
             <form name="updateForm" action='<c:url value='/board/questionBoardUpdate'/>' method="POST" enctype="multipart/form-data">   

                <div id="boast_title">
                    <label for="title">제목</label> 
                    <div id="title_input">
                        <input type="text" style="width:500px; height:25px; border: rgb(218, 206, 206) solid 1px;" id="title" name="PO_TITLE" value=<c:out value="${detail.PO_TITLE }"/>><p/>
                    </div>       
                </div>


                <div id="boast_author">
                    <label for="author">작성자</label>
                    <div id="author_input">
                        <input type="text" style="width:500px; height:25px; border: rgb(218, 206, 206) solid 1px;" id="author" name="MEM_ID" value=<c:out value="${detail.MEM_ID }"/> readonly><p/>
                    </div>
                </div>
                
                <div id="boast_select">
	                <label for="kind">분류</label>
	                <div id="select_input">
	                	<select name="INFO_KIND">
			                <option id="kind" value="강아지">강아지</option>
			                <option id="kind" value="고양이">고양이</option>
			                <option id="kind" value="기타">기타</option>
			            </select><br>  
	                </div>
			              
                </div>
                
                
                            
                <div id="boast_content">
                
	                <label for="content" style="font-weight:700;">내용</label> <br><br>
	                
		            <textarea id="content" rows="10" style="width:1000px; height:500px; border: rgb(218, 206, 206) solid 1px; margin-top:-10px; resize:none;" name="PO_CONTENT"><c:out value="${detail.PO_CONTENT }"/></textarea><p/>
		                       
		            <input type="hidden" name="PO_NUM" value=<c:out value="${detail.PO_NUM }"/>>
			        <input type="hidden" name="BO_NUM" value=<c:out value="4"/>>
			        <input type="hidden" name="page" value=<c:out value="${scri.page}"/>>
			        <input type="hidden" name="perPageNum" value=<c:out value="${scri.perPageNum}"/>>
			        <input type="hidden" name="searchType" value=<c:out value="${scri.searchType}"/>>
			        <input type="hidden" name="keyword" value=<c:out value="${scri.keyword}"/>>
			        <input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
			        <input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
                
                
                
                
                
                    <%-- <label for="content">내용</label> <br>
                    <div id="text_input">
                        <textarea id="content" rows="10" name="PO_CONTENT"><c:out value="${detail.PO_CONTENT }"/></textarea><p/>
                            
                        <input type="hidden" name="PO_NUM" value=<c:out value="${detail.PO_NUM }"/>>
                        <input type="hidden" name="BO_NUM" value=<c:out value="1"/>>
                        <input type="hidden" name="page" value=<c:out value="${scri.page}"/>>
                        <input type="hidden" name="perPageNum" value=<c:out value="${scri.perPageNum}"/>>
                        <input type="hidden" name="searchType" value=<c:out value="${scri.searchType}"/>>
                        <input type="hidden" name="keyword" value=<c:out value="${scri.keyword}"/>>
                        <input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
                        <input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
                    </div> --%>
                    
                </div>   
           
               
               <%--  <div id="fileIndex">
                    <c:forEach var="file" items="${file}" varStatus="var">
                    <div>
                        <img src="/contest/fileDown?imageFileName=${file.ORG_FILE_NAME}&FI_NUM=${file.FI_NUM}&BO_NUM=1"><br>
                        <input type="hidden" id="FILE_NO" name="FI_NUM_${var.index}" value="${file.FI_NUM }">
                        <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FI_NUM_${var.index}">
                        <a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
                        <button id="fileDel" onclick="fn_del('${file.FI_NUM}','FI_NUM_${var.index}');" type="button">삭제</button><br>
                    </div>
                    </c:forEach>
                </div> --%>
                
                
                <button type="button" class="fileAdd_btn">파일추가</button>
                
                <div id="fileIndex">
			          <c:forEach var="file" items="${file}" varStatus="var">
			               <div>
			                  <input type="hidden" id="FILE_NO" name="FI_NUM_${var.index}" value="${file.FI_NUM }">
			                  <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FI_NUM_${var.index}">
			                  <a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
			                  <button id="fileDel" onclick="fn_del('${file.FI_NUM}','FI_NUM_${var.index}');" type="button">삭제</button><br>
			               </div>
			         </c:forEach>
			     </div>
               
                <div id="buttonBox">
                    <button type="button" style="width:100px; height:30px; margin-right:30px; margin-left:-50px; cursor:pointer;" class="update_btn">수정</button>
                    <button type="button" style="width:100px; height:30px;" class="cancel_btn">취소</button>
                </div>
                
               
            </form> 
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <%-- <div id="input" style="width:100%; height:1000px; padding-left:20px;" >
            
            <form name="updateForm" action='<c:url value='/board/questionBoardUpdate'/>' method="POST" enctype="multipart/form-data">      
            
            <div style="" >
            
               <div style="margin-bottom:-20px; width:100px; height:20px; font-weight:700;">
                  <label for="title"  >제목</label> 
               </div>
               
                 <input type="text" id="title" name="PO_TITLE" value=<c:out value="${detail.PO_TITLE }"/>><p/>
            </div>
            
            
            
            
            <div style=" margin-top:30px; margin-bottom:70px; font-weight:700;" >
            
               <div style="margin-bottom:10px;  width:100px; height:20px;">
                  <label for="author">작성자</label> 
               </div>
               
                 <input type="text" id="author" name="MEM_ID" value=<c:out value="${detail.MEM_ID }"/> readonly><p/>
            </div>
            
           <label for="kind">분류</label>
            <select name="INFO_KIND">
                <option id="kind" value="강아지">강아지</option>
                <option id="kind" value="고양이">고양이</option>
                <option id="kind" value="기타">기타</option>
            </select><br>            
            
            <div id="fileIndex">
                <c:forEach var="file" items="${file}" varStatus="var">
                     <div>
                     <img src="/fileDown?imageFileName=${file.ORG_FILE_NAME}&FI_NUM=${file.FI_NUM}&BO_NUM=4"><br>
                     <input type="hidden" id="FILE_NO" name="FI_NUM_${var.index}" value="${file.FI_NUM }">
                     <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FI_NUM_${var.index}">
                     ${file.ORG_FILE_NAME} (${file.FILE_SIZE}kb)
                     <button id="fileDel" onclick="fn_del('${file.FI_NUM}','FI_NUM_${var.index}');" type="button">삭제</button><br>
                     </div>
               </c:forEach>
           </div>
      
            <label for="content" style="font-weight:700;">내용</label> <br><br>
            <textarea id="content" rows="10" style="width:1000px; height:500px; resize:none;" name="PO_CONTENT"><c:out value="${detail.PO_CONTENT }"/></textarea><p/>
                       
            <input type="hidden" name="PO_NUM" value=<c:out value="${detail.PO_NUM }"/>>
            <input type="hidden" name="BO_NUM" value=<c:out value="4"/>>
            <input type="hidden" name="page" value=<c:out value="${scri.page}"/>>
            <input type="hidden" name="perPageNum" value=<c:out value="${scri.perPageNum}"/>>
            <input type="hidden" name="searchType" value=<c:out value="${scri.searchType}"/>>
            <input type="hidden" name="keyword" value=<c:out value="${scri.keyword}"/>>
            <input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
            <input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
           
           <div style="margin-bottom:30px; width:100%; height:100px; ">
              <button type="button" class="fileAdd_btn">파일추가</button>
           </div>
           
           
           
           <div style="display:inline-flex; padding-left:370px; width:1030px; height:50px;">
           
              
              
              <button type="button" class="update_btn" onclick="update()" style="margin-right:20px; width:100px; height:30px; ">수정</button>
              <button type="button" class="cancel_btn" style="width:100px; height:30px;">취소</button> 
              
             
              
           </div>     
         </form>  
       </div> --%>
         
         
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

    <!-- <div id="kakao">
        <img src="/resources/images/kakaoimage.png" alt="" id="kakao_logo">
        <div>
            <img src="/resources/images/up2.png" style="cursor: pointer;" alt="" id="up" onclick="window.scrollTo(0,0);">
        </div>
        
    </div> -->

</body>
</html>