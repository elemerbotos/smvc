<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					New recipe <a href="/j_spring_security_logout">
						<button type="submit" class="btn btn-default">
							<i class="glyphicon glyphicon-log-out"></i> Log out
						</button>
					</a>
				</h1>

				<div class="page-header"></div>
				<div class="row">

					<div class="col-md-2, menu-items-center">
						<a href="/recipes">Recipes</a>
					</div>
					<div class="col-md-2, menu-items-center">
						<a href="/ingredients">Ingredients</a>
					</div>
					<div class="col-md-2, menu-items-center">
						<a href="/users">Users</a>
					</div>
					<div class="col-md-2, menu-items-center">
						<a href="/help">Help</a>
					</div>
					<div class="col-md-2, menu-items-center">
						<a href="/">Home</a>
					</div>
				</div>
			</div>
			<br> <br> <br>
			<form:form role="form" action="/addIngredient" method="POST"
				commandName="ingredientForm">
				<div class="form-group">
					<label for="Name">Name</label>
					<form:input type="text" name="name" class="form-control" id="name"
						placeholder="Enter the name of ingredient!" path="name" />
				</div>

				<div class="form-group">
					<label for="description">Description</label>
					<form:textarea rows="10" cols="50" name="description" id="description"
						class="form-control" placeholder="Enter the description of the ingredient!"
						path="description"></form:textarea>
				</div>

				<div class="form-group">
					<label for="price">Price per unit (100 g)</label>
					<form:input type="number" name="price" class="form-control"
						id="price"
						placeholder="Enter the price of the ingredient!"
						path="price"/>
				</div>
				
				<div class="form-group">
					<button type="submit" class="btn btn-default" value="Send" />
				</div>
				</form:form>
		</div>
		<div class="col-md-2"></div>

	</div>

</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</html>
