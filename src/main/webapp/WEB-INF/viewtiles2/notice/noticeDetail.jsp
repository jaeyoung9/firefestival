<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<c:forEach items="${NDetail}" var="ndetail">
   <title>${ndetail.NOTICE_TITLE}</title>
   </c:forEach>

</head>
<body>
   <c:forEach items="${NDetail}" var="ndetail">
   
   </c:forEach>
</body>
</html>