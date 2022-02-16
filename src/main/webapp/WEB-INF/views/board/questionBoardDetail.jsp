<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
   	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   	<title>궁금해요</title>

   	<link rel="stylesheet" href="/resources/css/boastdetail.css">
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
        </nav>
    </header>
    <div id="header_back">
    </div>
    <section id="container">
        <div id="title">
            <p>궁금해요</p>
        </div>
        
        
        
        
        <form name="readForm" action = "/board/questionBoardUpdate" role="form" method="get">
               <input type="hidden" name="BO_NUM" value=<c:out value="4"/>>
               <input type="hidden" name="PO_NUM" value=<c:out value="${detail.PO_NUM}"/>>
               <input type="hidden" name="page" value=<c:out value="${scri.page}"/>>
               <input type="hidden" name="perPageNum" value=<c:out value="${scri.perPageNum}"/>>
               <input type="hidden" name="searchType" value=<c:out value="${scri.searchType}"/>>
               <input type="hidden" name="keyword" value=<c:out value="${scri.keyword}" />>
           
               
         
         
         <div id="contents" >
                <div>
                    <p id="contents_title"><c:out value="${detail.PO_TITLE }"/>.</p>
                </div>
                <div>
                    <p id="contents_id">${detail.MEM_ID }</p>
                </div>
                <div id="contents_details">
                    <div>
                        <p id="detail1">${detail.PO_DATE }</p>
                    </div>
                    <div>
                        <p id="detail2">조회 ${detail.PO_CLICKS }</p>
                    </div>
                    
                    <div>
                       <p id="detail2"><c:out value="${detail.INFO_KIND }"/></p>
                    </div>
                    
                    <div id="detail3_func" style="text-decoration: none;">
                    
                       
                       <div>
                        <c:if
                           test="${(authInfo.id eq detail.MEM_ID) || (authInfo.manager eq 1)}">
                           
                           <td>
                              <input type="button" style="margin-top:15px; margin-left:-10px;" value="수정" id="updateSubmit">
                              <input type="button" style="margin-right:10px;" onclick="checkPostDelete()" value="삭제">
                           </td>
                        </c:if>
                        
                         <p />
                     </div>
                       
                    
                        <!-- <a href="/contest/contestBoardUpdate.jsp"><p><input type="button" value="수정" id="updateSubmit"></p></a>
                        <a href=""><p style="margin-left: 20px;"><input type="button" onclick="checkPostDelete()" value="삭제"></p></a>  -->
                    </div>
                </div>
                <div>
                    <hr>
                </div>
                <div>
                    <div id="contents_box">
                        <pre>${detail.PO_CONTENT }</pre>
                    </div>            
                </div>
                
                
                <c:if test="${(file ne null) && (file ne '') &&  (file ne '[]')}">
               
               <div class="form-group" style="margin-bottom:20px;" >
                  <c:forEach var="file" items="${file}" varStatus="status">
                     <img style="margin-left:20px;" src="/fileDown?imageFileName=${file.ORG_FILE_NAME}&FI_NUM=${file.FI_NUM}&BO_NUM=4"><br>
                     <input type="hidden" id="FI_NUM" name="FI_NUM" value="${file.FI_NUM}">
                  </c:forEach>
                  
                  
               </div>
            </c:if>
                      
         </div>
         
         
         
   </form>
   
   
    <p id="repl_title">댓글 <span style="font-size:13px;">${cnt}개</span></p> 
         
         <!-- 댓글 개수 -->
            <div style="margin-top:30px;"> 
            
               <c:if test="${authInfo.id ne null}">
                  <form action="/board/commentBoardInsert" method="post" name="commentForm">
                  
                        <input type="hidden" name="BO_NUM" value=<c:out value="4"/>> 
                        <input type="hidden" name="PO_NUM" value=<c:out value="${detail.PO_NUM}"/>> 
                        <input type="hidden" name="page" value=<c:out value="${scri.page}"/>>
                        <input type="hidden" name="perPageNum" value=<c:out value="${scri.perPageNum}"/>>
                        <input type="hidden" name="searchType" value=<c:out value="${scri.searchType}"/>>
                        <input type="hidden" name="keyword" value=<c:out value="${scri.keyword}" />>
                        <input type="text" style="margin-bottom:20px; margin-left:20px;" name="MEM_ID" readonly value=<c:out value="${authInfo.id }"/>><br>
                        <textarea rows="5" style="margin-left:20px; margin-bottom:30px;  width:740px; height:80px; resize:none; " name="CO_CONTENT"  id="commentContent" 
                        placeholder="욕설 및 비방 댓글 작성 시 불이익이 있을 수 있음을 알려드립니다."  required></textarea>
                        
                        <div style="margin-left:20px; margin-bottom:30px;">
                        <input type="button" onclick="contentInsert()" value="등록">
                        </div>
                     
                  </form>
               </c:if>
           </div>
            
            
            <!-- 댓글 목록 -->
            <div id="repl">
                  <c:choose>
                     <c:when test="${fn:length(comment) > 0 }">
                        <c:forEach var="commentList" items="${comment}" varStatus="status">
                  
                            <div class="repl_section">
                                <p class="repl_id"><c:out value="${commentList.MEM_ID }"/>  </p>
                                <div id="cohead${commentList.CO_NUM}" >
                              <pre><p class="repl_content"><c:out value="${commentList.CO_CONTENT }"/></p></pre>
                           
                                
                                   <div>
                                       <c:if test="${(authInfo.id eq commentList.MEM_ID) || (authInfo.manager eq 1)}">
                                 
                                    <div style="display:inline-flex; margin-top:-30px; margin-left:20px;">
                                    
                                          <p class="repl_re" style="margin-right:20px;  font-size:13px; color: rgb(184, 177, 177);"  >
                                          <a style="color: rgb(184, 177, 177);" href="javascript:updateCommentBtn('${commentList.CO_NUM}','${commentList.MEM_ID }', 
                                             '${commentList.CO_CONTENT }', '${detail.PO_NUM}', '${scri.page}',
                                             '${scri.perPageNum}', '${scri.searchType}', '${scri.keyword}')">
                                            	 수정
                                          </a></p> 
                                          <p style="margin-top:10px;"><a class="disableLink" style="font-size:13px; text-decoration:underline; cursor:pointer; padding-top:30px; color: rgb(184, 177, 177);"  role="button" onclick="checkDelete('${commentList.CO_NUM}')">삭제</a></p>
                                          
                                          
                                          <div class="repl_func" style="margin-top:33px;">
                                                 <p>${commentList.CO_DATE}</p>
                                             </div>
                                    </div>                           
                                 </c:if> 
                              </div>                                   
                           </div>                          
                            </div>
                         </c:forEach>
                     </c:when>
                     <c:otherwise>
                        
                     
                             등록된 댓글이 없습니다
                     


                     </c:otherwise>
                  </c:choose>          
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











   <script type="text/javascript">
      // 글 삭제
      function checkPostDelete(){
          if(confirm('삭제하시겠습니까?')){
             
              self.location = "/board/questionBoardDelete?"
                  + "PO_NUM=${detail.PO_NUM}"
                  + "&page=${scri.page}&perPageNum=${scri.perPageNum}"
                  + "&searchType=${scri.searchType}&keyword=${scri.keyword}";
                  alert("삭제 완료")      
          }else{
             
          }
      } 
      
         // 댓글 삭제
      function checkDelete(conum) {
         var chk = confirm('삭제하시겠습니까?');
         
         if (chk == true) {
            self.location = "/board/commentBoardDelete?"
                  + "PO_NUM=${detail.PO_NUM}"
                  + "&CO_NUM=" + conum
                  + "&page=${scri.page}" 
                  + "&perPageNum=${scri.perPageNum}" 
                  + "&searchType=${scri.searchType}" 
                  + "&keyword=${scri.keyword}"
            alert('댓글이 삭제되었습니다!');
         } else{
            alert('취소')
         }
      }
      
      //목록가기
      $("#list_btn").click(function(){
         self.location = "/board/questionBoardList?"
                     + "page=${scri.page}&perPageNum=${scri.perPageNum}"
                     + "&searchType=${scri.searchType}&keyword=${scri.keyword}";
      });
      
      // 간편 유효성 검사
      function contentInsert(){
          var commentForm = document.commentForm;
          var commentContent = commentForm.commentContent.value;
         
          
          if(!commentContent){
              alert("댓글을 입력해주세요")
          }else{
             commentForm.submit();
          }
      }
      
      // 파일 다운
      function fn_fileDown(fileNo){
         var formObj = $("form[name='readForm']");
         $("#FI_NUM").attr("value", fileNo);
         formObj.attr("action", "/fileDown");
         formObj.submit();
      }
      
      //수정페이지 가기
      $("#updateSubmit").click(function(){
         var formObj = $("form[name='readForm']");
         formObj.attr("action", "/board/questionBoardUpdate");
         formObj.attr("method", "get");
         formObj.submit();
      });
      
      
      
      
      function updateCommentBtn(CO_NUM, MEM_ID, CO_CONTENT, PO_NUM, page, perPageNum, searchType, keyword){ 
         $('#cohead'+ CO_NUM).html(            
            "<form action='/comment/commentUpdate?CO_NUM="+CO_NUM+"&PO_NUM="+PO_NUM+"' name='commentEditForm' method='get'><br>"
            + "<button role='button' onclick='commentSubmit("+CO_NUM+","+PO_NUM+")' id='btnEdit'>완료</button> "
               + "<button role='button' onclick='history.go(0)' id='btnCancel'>취소</button><p/>"
               + "<input type='hidden' name='CO_NUM' value='"+CO_NUM+"'>"
               + "<input type='hidden' name='MEM_ID' value='"+MEM_ID+"'>"
               + "<input type='hidden' name='PO_NUM' value='"+PO_NUM+"'>"
               + "<input type='hidden' name='BO_NUM' value='4'>"
               + "<input type='hidden' name='page' value='"+page+"'>"
               + "<input type='hidden' name='perPageNum' value='"+perPageNum+"'>"
               + "<input type='hidden' name='searchType' value='"+searchType+"'>"
               + "<input type='hidden' name='keyword' value='"+keyword+"'>"
               
               + "<textarea id='commentContent' name='CO_CONTENT' required>"+CO_CONTENT+"</textarea>"
               + "<style>#commentContent{width:740px; height:80px; resize:none;} </style>"
         );
         
         }
         
      function commentSubmit(CO_NUM, PO_NUM){
         var commentForm = document.commentEditForm;
         var commentContent = commentForm.commentContent.value;
         if(!commentContent&&commentContent==''){
            alert("댓글을 입력해주세요")
         }else{
            commentForm.submit();
         }
      }
            
         
      
   </script>

</body>
</html>