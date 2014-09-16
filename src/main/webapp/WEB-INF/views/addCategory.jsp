<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body class="the_best_background">
	<c:if test="${error == true}">
		<script type="text/javascript">
			alert("Already existing category!");
		</script>
	</c:if>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="page-header">
				<div class="row">
					<div class="col-md-8">
						<h1>Add new category</h1>
					</div>
					<div class="col-md-4 logout">
						<a href="/j_spring_security_logout">
							<button type="submit" class="btn btn-default">
								<i class="glyphicon glyphicon-log-out"></i> Log out
							</button>
						</a>
					</div>
				</div>

				<hr>

				<div class="row">

					<div class="col-md-3 menu-items-center">
						<a href="/recipes">Recipes</a>
					</div>
					<div class="col-md-3 menu-items-center">
						<a href="/ingredients">Ingredients</a>
					</div>
					<div class="col-md-3 menu-items-center">
						<a href="/users">Users</a>
					</div>
					<div class="col-md-3 menu-items-center">
						<a href="/">Home</a>
					</div>
				</div>
			</div>
			<div class="mainContent">
				<form:form role="form" action="/addCategory" method="POST"
					commandName="categoryForm">
					<div class="form-group">
						<label for="Name">Name</label>
						<form:input type="text" name="name" class="form-control" id="name"
							placeholder="Enter the name of category!" path="name"
							required="true" />
						<form:errors path="name" cssClass="alert-danger" />
					</div>


					<div class="form-group">
						<button type="submit" class="btn btn-default" value="Send">Send</button>
						<input action="action" type="button"
							onclick="history.go(-1);" value="Return to previous page"
							class="btn btn-default" />
					</div>
				</form:form>
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
