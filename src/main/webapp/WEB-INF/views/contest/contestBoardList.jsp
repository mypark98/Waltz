<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>

	

	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>자랑하기</title>
    
    <link rel="stylesheet" href="/resources/css/contest.css">
    
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
			        <ul id="personal" >
			            <li>
			                 <a href="/login" style="font-size:13px;"><i class="fa fa-sign-in"></i> 로그인</a>
			             </li>
			             <li>
			                 <a href="/register/step1" style="font-size:13px; "><i class="fa fa-user"></i> 회원가입</a>
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
				                  
				                 <li style="font-size:13px; margin-top:2px;">
				                       <a href="/list"><i class="fa fa-sign-out"></i> 회원목록</a>
				                 </li>                    
				                 <li style="font-size:13px; margin-top:2px;">
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
        	<p>자랑하기</p>
		    <div style="font-size:15px; margin-left:20px;">
		        <c:if test="${scri.keyword ne null && scri.keyword ne ''}">		
					<p style="font-size:15px;">'${scri.keyword}'로 검색된 게시글의 수 : ${count}건</p>
				</c:if>
		    </div>
        </div>
        <div id="contest_box">
        
        
        
        
        
        
        
        	<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach var="bList" items="${list}" varStatus="i">
        
        
        
                
                
			                <div id="board_contest_section">
			                    <div id="contest_img">
                    
                    
                    				<img src="/contest/fileDown?imageFileName=${Thumbnail[i.index].STORED_FILE_NAME}&FI_NUM=${Thumbnail[i.index].FI_NUM}&BO_NUM=1"> 
                    
                    
                        		  
                        
                        
                        
                        
                    </div>
                    <div id="contest_detail1">
                        <p id="contest_id">${bList.MEM_ID }</p>
                        <p id="contest_date"><c:out value="${bList.PO_DATE }"/></p>
                    </div>
                    <div id="contest_text">
                        <a style="text-decoration-line:none;" href="/contest/contestBoardDetail?PO_NUM=${bList.PO_NUM}&BO_NUM=1&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${bList.PO_TITLE }"/></a>
                    </div>
                    <div id="contest_count">
                        <div id="contest_click">
                           		 조회수 <span style="font-size: 15px;"><c:out value="${bList.PO_CLICKS }"/></span>
                        </div>
                        
                        <div id="contest_speak">
                            <div id="speak_count">
                                <img src="/resources/images/speak2.png" alt=""> 
                                <div id="countNum">
                                    <c:out value="${cntList[i.index]}"/>
                                </div>       
                            </div>    
                        </div>
                    </div>
                </div>
                
                </c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
		</c:choose>
                
                
                
                

            </div>

	        
					
		
        
        
        <!-- 페이징 -->
        <div style="width:1030px; height:50px;  padding-bottom:-70px;">
	        <div style="margin-left:350px; width:400px; height:50px; ">
		        <ul style="font-size:20px;">
		        
				    <c:if test="${pageMaker.prev }">
				           <a style="margin-right:10px; text-decoration:none;" href='<c:url value="/contest/contestBoardList?page=${pageMaker.startPage-1}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${keyword}"/>'>&lt;</a>
				    </c:if>
				    
				    <div>
				    	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
				           <a style="margin-right:10px; text-decoration:none;" href='<c:url value="/contest/contestBoardList?page=${pageNum}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"/>'>${pageNum} </a>
				    	</c:forEach>
				    </div>
				    
				    
				    
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				            <a style="margin-right:10px; text-decoration:none;" href='<c:url value="/contest/contestBoardList?page=${pageMaker.endPage+1}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${keyword}"/>'>&gt;</a>
				    </c:if>
				    
			    </ul>
	        </div>
	        
        </div>
        
        
        <!-- 검색기능 -->
        <div style="    width:1030px; height:70px; ">
	        <div class="search" style="width:600px;  height:50px;   margin-left:250px;    ">
		        <form action="" method="get"  style="display:inline-flex; "  >
				
				    <select name="searchType">
				      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>분류</option>
				      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				    </select>
				
				    <input type="text" style="margin-left:20px; width:400px;" name="keyword" id="keywordInput" value=<c:out value="${scri.keyword}"/>>
					
				    <button id="searchBtn" style="margin-left:20px;" type="button">검색</button>
			  	
	        	</form>
	        </div>
        </div>
	    
		
        
        <div id="boast_btn" style="border:none;">
            <div id="btn_box">
            
            
                
                
                <c:if test="${authInfo.name != null}">
					<button style=" background-color: rgb(79, 134, 216); border:none; margin-bottom:50px; "><a style="text-align:center; color:white; font-size:15px; margin-top:10px; padding-top:5px; text-decoration:none;" href='<c:url value='/contest/contestBoardWrite?page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'/>' role="button" id="btn1">글쓰기</a></button>
				</c:if>
                
                
            </div>
            
        </div>
        	
				 <%-- <c:if test="${scri.keyword ne null && scri.keyword ne ''}">		
					'${scri.keyword}'로 검색된 게시글의 수 : ${count}건
				</c:if> --%>
			

 	
		 <%-- <table border="1">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>글 제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>조회수</th>
					<c:if test="${authInfo.manager eq 1}">
					<th>삭제</th>
					</c:if>
				</tr>			
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach var="bList" items="${list}">
							<tr>
								<td><c:out value="${bList.RNUM }"/></td>
								<td><a href="/contest/contestBoardDetail?PO_NUM=${bList.PO_NUM}&BO_NUM=1&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${bList.PO_TITLE }"/></a></td>
								<td><c:out value="${bList.MEM_ID }"/></td>
								<td><c:out value="${bList.PO_DATE }"/></td>
								<td><c:out value="${bList.PO_CLICKS }"/></td>
								<c:if test="${authInfo.manager eq 1}">
					              <td><a class="disableLink" onclick="checkDelete()" href='<c:url value='/contest/contestBoardDelete?PO_NUM=${bList.PO_NUM}'/>'>삭제</a></td>
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
	 --%>
		
    
    
    
	
        
        
        
        
        

       

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
    
    	$(function(){
        	$('#searchBtn').click(function() {
          		self.location = "/contest/contestBoardList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        	});
      	});  
      
       // 글 삭제
         function checkDelete(pno){
        if(confirm('삭제하시겠습니까?')){
           
            self.location = "/contest/contestBoardDelete?"
                + "PO_NUM=" + pno
                + "&page=${scri.page}&perPageNum=${scri.perPageNum}"
                + "&searchType=${scri.searchType}&keyword=${scri.keyword}";
                alert("삭제 완료")      
        }else{
           alert("삭제 취소")    
        }
    } 
  
      
    </script>


    

</body>
</html>