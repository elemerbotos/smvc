<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html ng-app="registrationApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div id="mainContent">
		<div class="max-width-30 center-with-auto-div" ng-controller="registrationCtrl">
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
					<label class="col-sm-2 control-label">Name</label> <br>
					<div class="col-sm-10">
						<form:input path="username" type="text" class="form-control"
							placeholder="Name" ng-model="input"/>
						<c:if test="${not empty status.getFieldError('username') }">
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</c:if>
						<alert ng-repeat="alert in alerts" type="{{alert.type}}" close="closeAlert($index)" >{{alert.msg}}</alert>
<!-- 						class="alert alert-danger" -->
					</div>
				</div>
				<div
					class="form-group ${not empty status.getFieldError('password') ? 'has-error has-feedback' : ''}">
					<label class="col-sm-2 control-label">Password</label> <br>
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
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.10/angular.js"></script>
<script
	src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.11.0.js"></script>

<script src="<c:url value="/resources/js/registration.js" />"></script>
</html>
