<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div id="mainContent">
		<div class="max-width-30 center-with-auto-div">
			<h1>Register</h1>
			<c:if test="${not empty save and save}">
				<p class="bg-success">
					Registration successfull. <br />
				</p>
			</c:if>
			
			<c:if test="${error}">
				<script type="text/javascript">alert("${errorMsg}");</script>
			</c:if>
			
			<form:form class="form-horizontal"
				role="form" action="register" method="post" commandName="userForm">
				<form:errors path="*" cssClass="bg-danger" element="p" />

				<div
					class="form-group ${not empty status.getFieldError('username') ? 'has-error has-feedback' : ''}">
					<label class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<form:input path="username" type="text" class="form-control"
							placeholder="Name" />
						<c:if test="${not empty status.getFieldError('username') }">
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</c:if>
					</div>
				</div>
				<div
					class="form-group ${not empty status.getFieldError('password') ? 'has-error has-feedback' : ''}">
					<label class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<form:input path="password" type="password" class="form-control"
							placeholder="Password" />
						<c:if test="${not empty status.getFieldError('password') }">
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</c:if>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">Sign up</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
