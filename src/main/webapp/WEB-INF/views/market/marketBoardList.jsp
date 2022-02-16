<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>



   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>왈츠장터</title>
    <link rel="stylesheet" href="/resources/css/market.css">

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
        <div id="title">
            <p>왈츠장터</p>
        </div>
        <div id="board_boast">
        
        
        
           <c:choose>
            <c:when test="${fn:length(list) > 0 }">
               <c:forEach var="bList" items="${list}" varStatus="i">
           
           
                    <div id="boast_box">
                            <div class="boast_section">
                                <div id="boast_text">
                                    <div id="boast_title">
                                        <p><a style="text-decoration:none;" href="/market/marketBoardDetail?PO_NUM=${bList.PO_NUM}&BO_NUM=2&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
                                 <c:out value="${bList.PO_TITLE }" /></a></p>
                                 
                                 
                                 
                                    </div>
                                    <div id="boast_price">
                                        <p><fmt:formatNumber value="${bList.MAR_PRICE}" pattern="#,###,###"/></p>
                                        <c:if test="${authInfo.manager eq 1}">
						                     <a style="margin-left:260px; class="disableLink" onclick="checkDelete()"
						                        href='<c:url value='/market/marketBoardDelete?PO_NUM=${bList.PO_NUM}'/>'>삭제</a>
						                 </c:if>
                                    </div>
                                    <div id="boast_content">
                                    
                                       <pre><c:out value="${bList.PO_CONTENT}" /></pre>
                                    
                                       
                                    </div>
                                    <div id="boast_num">
                                        <div>
                                            <p id="boast_id">${bList.MEM_ID}</p>
                                        </div>
                                        <div>
                                            <p id="boast_count">조회 ${bList.PO_CLICKS }</p>
                                        </div>
                                        <div id="boast_date_box">
                                            <p id="boast_date">${bList.PO_DATE }</p>
                                        </div>
                                        
                                        <div id="boast_speak">
                                            <img src="/resources/images/speak2.png" alt="">
                                            <div id="boast_countnum"> <c:out value="${cntList[i.index]}"/> </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="board_img_box">
                                
                                    <div id="boast_img">
                                       <img src="/market/fileDown?imageFileName=${Thumbnail[i.index].STORED_FILE_NAME}&FI_NUM=${Thumbnail[i.index].FI_NUM}&BO_NUM=2"> 
                                    </div>
                                </div>
                            </div>
                        </div>
                  
                     
                  
               </c:forEach>
            </c:when>
            <c:otherwise>
                  
               <p>등록된 게시글이 없습니다.</p>
                  
            </c:otherwise>
         </c:choose>
         
         
        

        </div>
        <div style="width:1030px; height:80px;   padding-left:300px;" id="page_Num">
           <div>
                <ul>
                <c:if test="${pageMaker.prev }">
                       <a href='<c:url value="/market/marketBoardList?page=${pageMaker.startPage-1}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${keyword}"/>'>&lt;</a>
                </c:if>
                
                <div>
                   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                          <a href='<c:url value="/market/marketBoardList?page=${pageNum}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"/>'>${pageNum} </a>
                   </c:forEach>
                </div>
                
                <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                        <a href='<c:url value="/market/marketBoardList?page=${pageMaker.endPage+1}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${keyword}"/>'>&gt;</a>
                </c:if>
             </ul>
           </div>  
        </div>
        
        <div style="width:1030px; height:50px; margin-left:300px; ">
           <form action="" method="get">
            <div class="search" style="margin-left:100px; width:800px;">
                <select name="searchType" style="margin-left:-100px;">
                  <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
                  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
                  <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
                  <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
                  <option value="p"<c:out value="${scri.searchType eq 'p' ? 'selected' : ''}"/>>가격</option>
                  <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
                </select>
            
                <input type="text" name="keyword" id="keywordInput" style="width:300px;" value=<c:out value="${scri.keyword}"/>>
               
                <button id="searchBtn" type="button">검색</button>
                
      
              </div>
         </form>
        </div>
        
       
        
        <div style="width:1030px; height:100px; text-align:center;">
         <button style="width:100px; height:30px; text-decoration:none; background-color: rgb(79, 134, 216); border:none; cursor:pointer;">
            <a style="color:white; text-decoration:none; " href='<c:url value='/market/marketBoardWrite?page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'/>' role="button">글쓰기</a>
         </button>
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
        <img src="/resources/images/image/kakaoimage.png" alt="" id="kakao_logo">
        <div>
            <img src="/resources/images/up2.png" style="cursor: pointer;" alt="" id="up" onclick="window.scrollTo(0,0);">
        </div>
        
    </div>

    <script src="../js/question.js"></script>



   <%-- <h2>왈츠장터</h2>
   <c:if test="${scri.keyword ne null && scri.keyword ne ''}">      
            '${scri.keyword}'로 검색된 게시글의 수 : ${count}건
   </c:if>
     <c:if test="${authInfo.name != null}">
      <a href='<c:url value='/market/marketBoardWrite?page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'/>' role="button">글쓰기</a>
   </c:if>
      <a href='<c:url value='/'/>' role="button">뒤로가기</a>
   
   <div>
      <table border="1">
         
         <tbody>
            <c:choose>
               <c:when test="${fn:length(list) > 0 }">
                  <c:forEach var="bList" items="${list}">
                     <tr>
                        <td><c:out value="${bList.RNUM }" /></td>
                        <td>
                        <a href="/market/marketBoardDetail?PO_NUM=${bList.PO_NUM}&BO_NUM=2&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
                        <c:out value="${bList.PO_TITLE }" /></a></td>
                        <td><c:out value="${bList.MEM_ID }" /></td>
                        <td><c:out value="${bList.PO_DATE }" /></td>
                        <td><c:out value="${bList.PO_CLICKS }" /></td>
                        <td><c:out value="${bList.MAR_PRICE }" /></td>
                        <c:if test="${authInfo.manager eq 1}">
                           <td><a class="disableLink" onclick="checkDelete()"
                              href='<c:url value='/market/marketBoardDelete?PO_NUM=${bList.PO_NUM}'/>'>삭제</a></td>
                        </c:if>
                     </tr>
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <tr>
                     <td colspan="5">등록된 게시글이 없습니다.</td>
                  </tr>
               </c:otherwise>
            </c:choose>
         </tbody>
      </table>
   </div> --%>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   <!-- 페이징 기능 -->
    <%-- <ul>
       <c:if test="${pageMaker.prev }">
              <a href='<c:url value="/market/marketBoardList?page=${pageMaker.startPage-1}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${keyword}"/>'>&lt;</a>
       </c:if>
       <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
              <a href='<c:url value="/market/marketBoardList?page=${pageNum}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"/>'>${pageNum} </a>
       </c:forEach>
       <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
               <a href='<c:url value="/market/marketBoardList?page=${pageMaker.endPage+1}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${keyword}"/>'>&gt;</a>
       </c:if>
    </ul> --%>

   
   <!-- 검색기능 -->
   
   
   <script>
               $(function(){
                 $('#searchBtn').click(function() {
                   self.location = "/market/marketBoardList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
                 });
               });  
               
               function checkDelete() {
                  
                var chk = confirm('삭제하시겠습니까?');

                if (chk == true) {
                      //document.getElementById("disableLink").setAttribute('href','/market/marketBoardDelete?PO_NUM=${bList.PO_NUM}');
                   alert('게시글이 삭제되었습니다!');
                } else if (chk == false) {
                   //$('a[class="disableLink"]').unwrap();
                   document.querySelector(".disableLink").removeAttribute('href'); 
                      location.reload();
                }
             }
               
               
          </script>

</body>
</html>