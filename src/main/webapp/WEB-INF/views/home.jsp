<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="page-header">
				<h1>
					Hello
					<sec:authentication property="name" />
					! Welcome home :)
				</h1>
				<div class="page-header">
					<a href="/j_spring_security_logout">
						<button type="submit" class="btn btn-default">
							<i class="glyphicon glyphicon-log-out"></i> Log out
						</button>
					</a>
				</div>
				<div class="row">

					<div class="col-md-2">
						<a href="/recipes">Recipes</a>
					</div>
					<div class="col-md-3">
						<a href="/ingredients">Ingredients</a>
					</div>
					<div class="col-md-2">
						<a href="/users">Users</a>
					</div>
					<div class="col-md-3">
						<a href="/help">Help</a>
					</div>
					<div class="col-md-2">
						<a href="/">Home</a>
					</div>
				</div>
			</div>
			<br> <br> <br>
			<div style="">
				<img src="resources/img/339612-svetik.jpg" class="img-rounded"
					width="70%" />
			</div>

		</div>

		<div class="col-md-2"></div>

	</div>

</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</html>
