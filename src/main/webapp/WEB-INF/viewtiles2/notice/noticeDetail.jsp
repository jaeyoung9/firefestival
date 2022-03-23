<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<c:forEach items="${ndetail}" var="ndetail">
   <title>공지사항 - ${ndetail.NOTICE_TITLE}</title>
   </c:forEach>

</head>
<body>
   <c:forEach items="${ndetail}" var="ndetail">
    ${ndetail.NOTICE_TITLE}
   </c:forEach>

</body>
</html>