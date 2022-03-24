<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script charset = "utf-8"></script>
<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
<script type = "text/javascript">
$(document).ready(function()){
	var message = "${message}";
	if(message != null && message !=''){
		alert(message);
		location.href = "<c:url value='/loginForm'/>";
	}else{
		alert("로그인 되었습니다");
		location.href = "<c:url value='/main'/>";
	}
}

</script>
</head>
<body>

</body>
</html>