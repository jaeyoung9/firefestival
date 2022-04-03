<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 신청 내역</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-15 col-md-10 col-lg-50 mx-auto">
				<div class="card card-signin my-10">
					<div class="card-body">
						<div align="center">
							<h1 class="card-title text-center">
								<Strong>이벤트 신청 내역</Strong>
							</h1>
							<c:forEach items="${applyList}" var="applyList">
								<tr align="center" id="row">
									<br>
									<div align="left">
										<h3>이벤트 신청 번호 : ${applyList.EVENT_APPLY_NUM}<br></h3>
										<h3>이벤트 신청 ID : ${applyList.USER_ID}<br></h3>
										<h3>신청한 이벤트 번호 : ${applyList.EVENT_INDEX}<br></h3>
										<h3>신청한 이벤트 제목 : ${applyList.EVENT_TITLE}<br></h3>
										<form id="win" method="POST" action="<c:url value='/event/win'/>">
											<input type="text" maxlength="3" id="EVENT_WIN"
												name="EVENT_WIN" value="${applyList.EVENT_WIN}"
												placeholder="당첨됨" />
											<input type="hidden" id="EVENT_APPLY_NUM" name="EVENT_APPLY_NUM"
												value="${applyList.EVENT_APPLY_NUM}" />
											<input type="hidden" id="EVENT_INDEX" name="EVENT_INDEX"
												value="${applyList.EVENT_INDEX}" />
											<button type="submit" onclick="win();">이벤트 당첨 여부 수정</button>
										</form>
									</div>
								</tr>
							</c:forEach>
						</div>
					</div>
				</div>
				<div>
					<button type="button" onclick="location.href='/fire/amin' "
						class="primary-btn header-btn text-capitalize mt-10">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function win() {

			var EVENT_WIN = $("#EVENT_WIN").val()

			if (EVENT_WIN == null || EVENT_WIN == '') {
				alert("이벤트 당첨 여부를 입력하세요.");
				return 0;
			}
			$("#EVENT_WIN").val(EVENT_WIN)

			EVENT_WIN.submit();
			alert("이벤트 당첨 여부가 수정되었습니다.")
		}
	</script>
</body>
</html>