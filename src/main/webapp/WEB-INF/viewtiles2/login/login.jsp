<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>

<script charset = "utf-8"></script>
<script type = "text/javascript">
$(document).ready(function()){
	var message = "${message}";
	if(message != null && message !=''){
		alert(message);
		location.href = "<c:url value='/loginForm'/>";
	}else{
		alert("·로그인 되었습니다.");
		location.href = "<c:url value='/main'/>";
	}
}

</script>
</head>
<body>

</body>
</html>