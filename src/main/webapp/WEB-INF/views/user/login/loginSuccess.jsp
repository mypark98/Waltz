<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>로그인 성공 페이지</title>
</head>
<body>
   
   <c:if test="${authInfo.authstatus eq 'Y' }">
      <script>location.href="/"</script>
   </c:if>
   
   <c:if test="${authInfo.authstatus ne 'Y' }">
      <script>alert("이메일 인증 후 이용해주세요.")</script>
      <script>location.href="/login"</script>
   </c:if>
   
</body>
</html>