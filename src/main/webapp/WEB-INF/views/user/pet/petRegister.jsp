<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링에서 지원하는 커스텀 태그 -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려동물 등록</title>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" href="resources/css/petregist.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">

    <script type="text/javascript">
	
	$(document).ready(function(){
	   // 취소
	   $(".cencle").on("click", function(){
	      location.href = "/";
	   })
   
   $("#submitBtn").on("click", function(){
      if($("#ANI_NAME").val()==""){
         alert("반려동물 이름을 입력해주세요.");
         $("#ANI_NAME").focus();
         return false;
      }
      if($("#ANI_KIND").val()==""){
         alert("반려동물 분류를 선택해주세요.");
         $("#ANI_KIND").focus();
         return false;
      }
      if($("#ANI_GENDER").val()==""){
         alert("반려동물 성별을 선택해주세요.");
         $("#ANI_GENDER").focus();
         return false;
      }
      if($("#ANI_TYPE").val()==""){
         alert("반려동물 품종을 입력해주세요.");
         $("#ANI_TYPE").focus();
         return false;
      }
      if($("#ANI_AGE").val()==""){
         alert("반려동물 나이를 입력해주세요.");
         $("#ANI_AGE").focus();
         return false;
      }
      if($("#ANI_WEIGHT").val()==""){
         alert("반려동물 몸무게를 입력해주세요.");
         $("#ANI_WEIGHT").focus();
         return false;
      }
      if($("#ANI_NEUTERING").val()==""){
         alert("반려동물 중성화 여부를 체크해주세요.");
         $("#ANI_NEUTERING").focus();
         return false;
      }
      
         $("#regForm").submit();
      
      });
   
      /* 이미지 업로드 */
      $("input[type='file']").on("change", function(e){
         
         /* 이미지 존재시 삭제 */
         if($(".imgDeleteBtn").length > 0){
            deleteFile();
         }
         
         let formData = new FormData();
         let fileInput = $('input[name="uploadFile"]');
         let fileList = fileInput[0].files;
         let fileObj = fileList[0];
                  
         if(!fileCheck(fileObj.name, fileObj.size)){
            return false;
         }
         
         formData.append("uploadFile", fileObj);
         
         $.ajax({
            url: '/uploadAjaxAction',
             processData : false,
             contentType : false,
             data : formData,
             type : 'POST',
             dataType : 'json',
             success : function(result){
                console.log(result);
                showUploadImage(result);
             }
         });   
      
      });
      
      let regex = new RegExp("(.*?)\.(jpg|png|jfif|jpeg)$");
      let maxSize = 1048576; //1MB   
      
      function fileCheck(fileName, fileSize){

         if(fileSize >= maxSize){
            alert("파일 사이즈 초과");
            return false;
         }
              
         if(!regex.test(fileName)){
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
         }
         
         return true;      
         
      }
      
      function showUploadImage(uploadResultArr) {
         
         if(!uploadResultArr || uploadResultArr.length == 0){return}
         
         let uploadResult = $("#uploadResult");
         
         let obj = uploadResultArr[0];
         
         let str = "";
         
         let fileCallPath = encodeURIComponent(obj.ani_UPLOADPATH + "/s_" + obj.ani_UUID + "_" + obj.ani_FILENAME);
         
         str += "<div id='result_card'>";
         str += "<img src='/display?fileName=" + fileCallPath +"'>";
         str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
         str += "</div>";
         
         uploadResult.append(str);
         
      }
      
      $("#uploadResult").on("click", ".imgDeleteBtn", function(e){
         
         deleteFile();
         
      });
      
      function deleteFile(){
         
         let targetFile = $(".imgDeleteBtn").data("file");
         
         let targetDiv = $("#result_card");
         
         $.ajax({
            url: '/deleteFile',
            data : {fileName : targetFile},
            dataType : 'text',
            type : 'POST',
            success : function(result){
               console.log(result);
               
               targetDiv.remove();
               $("input[type='file']").val("");
               
            },
            error : function(result){
               console.log(result);
               
               alert("파일을 삭제하지 못하였습니다.")
            }
         });
      }

      
      
   });
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
            
            <!-- <img src="../image/logo.png" alt=""> -->
            
        </div>

        

        <div id="mypage">
            <div id="mypage_title">
                
            </div>
            <div id="mypage_contents">
                <div id="mypage_up">
                    <div id="mypage_up_detail">
                        <div>
                            <p id="mypage_ment">반려동물 등록</p>
                        </div>


                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form:form role="form" commandName="pVo" action="/petRegister" method="POST" id="regForm">
                                        <div>
                                            <input type="hidden" name="ANI_NUM">
                                        </div>
                                        <div>
                                            <input type="hidden" id="MEM_ID" name="MEM_ID" value="${authInfo.id}" readonly="readonly">
                                        </div>
                                        <div>
                                            <form:input type="text" placeholder="Pet Name(이름)" path="ANI_NAME" id="ANI_NAME"/>
                                        </div>
                                        <br>
                                        
                                        <br>           
                                        <div>
                                        	<span>종류</span> <br><br>
                                            <form:radiobutton path="ANI_KIND" value="강아지" label="강아지"/>
                                            <form:radiobutton path="ANI_KIND" value="고양이" label="고양이"/>
                                            <form:radiobutton path="ANI_KIND" value="기타" label="기타"/>                
                                        </div>
                                        <br><br>	
                                        <div>
                                        	<span>성별</span> <br><br>
                                            <form:radiobutton path="ANI_GENDER" value="수컷" label="수컷"/>
                                            <form:radiobutton path="ANI_GENDER" value="암컷" label="암컷"/>                   
                                        </div>
                                        <br><br>
                                        <div>
                                            <form:input type="text" placeholder="Pet Breed(품종)" path="ANI_TYPE" id="ANI_TYPE"/>                   
                                        </div>
                                         <div>
                                            <form:input type="text" placeholder="Pet Age(나이)" path="ANI_AGE" id="ANI_AGE"/>             
                                        </div>
                                        <div>
                                            <form:input type="text" placeholder="Pet WEIGHT(몸무게)" path="ANI_WEIGHT" id="ANI_WEIGHT"/>                
                                        </div>
                                        <br> 
                                        <div id="neutering">
                                            <p>
                                           	 <span>중성화 여부</span>  <br>
                                            <span><form:radiobutton path="ANI_NEUTERING" value="O" label="O" id="ANI_NEUTERING"/></span> 
                                            <span><form:radiobutton path="ANI_NEUTERING" value="X" label="X" id="ANI_NEUTERING"/> </span> 
                                            </p>               
                                        </div>
                                        <br> 
                                         <div>
                                            <form:input type="text" placeholder="Medical History(과거 병력)" path="ANI_MEDICALHIS" id="ANI_MEDICALHIS"/>                  
                                        </div> 
                                        <div>
                                        	<span>사진</span> <br> <br>
                                            <input type="file" id ="fileItem" name='uploadFile'  accept="image/*" onchange="setThumbnail(event)"/>
                                            <div id="uploadResult">
                                            	
                                            </div>
                                        </div>
                        
                                        <br>
                        
                                            <button class="btn btn-success" type="button" id="submitBtn">등록 완료</button>
                                            <button class="cencle btn btn-danger" type="button" id="cancelBtn">취소</button>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
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

   
        <script>
        


function setThumbnail(event) { 

    var reader = new FileReader(); 
    reader.onload = function(event) { 
        var img = document.createElement("img"); 

        img.width = 220;
        img.height = 200;
        img.style.marginTop = "20px";
        img.style.right = 500;
        img.style.border = 'black solid 1px';

    img.setAttribute("src", event.target.result); 
    document.querySelector("div#image_container").appendChild(img); }; 
    
    reader.readAsDataURL(event.target.files[0]); }
</script>
    
</body>
</html>