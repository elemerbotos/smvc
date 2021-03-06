<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login screen</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body class="the_best_background">
	<c:if test="${successfullRegistration == true}">
		<script>
			alert("Succesfull registration!");
		</script>
	</c:if>

	<div class="panel panel-default">
		<c:if test="${not empty error }">
		<div class="erroBlock">
			Your login was unsuccessful. <br> Caused:
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }
		</div>
		</c:if>
		<div class="panel-body max-width-30 center-with-auto-div">
			<h1>Login</h1>
			<form action="j_spring_security_check" name="f" method="post"
				class="form-horizontal">
				<div class="form-group">
					<label for="user" class="col-sm-2 control-label fix-sized-label">Username </label>
					<div class="col-sm-10">
						<input type="text" name="j_username" class="form-control"
							id="username" placeholder="Enter username">
					</div>
				</div>
				<div class="form-group">
					<label for="passsword" class="col-sm-2 control-label fix-sized-label">Password
					</label>
					<div class="col-sm-10">
						<input type="password" name="j_password" class="form-control"
							id="password" placeholder="Enter Password">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox"
								name="_spring_security_remember_me"> Remember me </input>
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" name="Submit" id="submit" class="btn btn-default">Sign
							in</button>
					</div>
				</div>
				Don't have an account yet? <a href="/register" id="register">register</a>!

			</form>
		</div>
	</div>

</body>
</html>