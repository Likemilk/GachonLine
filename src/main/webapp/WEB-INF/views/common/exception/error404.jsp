<%@ page isErrorPage="true" import="java.io.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/resources/include/include.jsp"%>

<gachonTag:html>
<gachonTag:script>
</gachonTag:script>
<body>
	<GachonTag:nav-bar name="${LOGIN_MEMBER.memberName}" type="${LOGIN_MEMBER.memberType}"/>"noname" id="noname" />
	<div class="container">
		<div class="panel panel-warning">
			<div class="panel-heading">잘못된 접근</div>
			<div class="panel-body">
				접근이 잘못되어 통제되었습니다.<br /> 자세한 사항은 관리자를 통해 연락하십시오.
			</div>
		</div>
	</div>
</body>
</gachonTag:html>