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
				<div class="row">
					<div class="col-md-8">
						<h1>Recipe</h1>
					</div>
					<div class="col-md-4 logout">
						<a href="/j_spring_security_logout">
							<button type="submit" class="btn btn-default">
								<i class="glyphicon glyphicon-log-out"></i> Log out
							</button>
						</a>
					</div>
				</div>

				<div class="page-header"></div>
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

			<div class="modal-header">
				<h3 class="modal-title">${recipe.name}</h3>
			</div>
			<div class="modal-body">
				<h4>Category:</h4>
				${recipe.category.name} <br> <br> <br>
				<table class="table table-condensed">
					<tr>
						<th>Ingredient name</th>
						<th>Quantity (in gramms)</th>
					</tr>
					<c:forEach var="component" items="${recipe.components}">
						<tr>
							<td>${component.ingredient.name}</td>
							<td>${component.amount}</td>
						</tr>
					</c:forEach>
				</table>
				<br> 
				<h4>Description:</h4>${recipe.description} <br> <br> 
				<h4>Total price:</h4>${totalPrice} <br> <br>
				<h4>Creation date and user:</h4>${recipe.creation}, <i>${recipe.author.username}</i>
				 
			</div>
			<div class="modal-footer">
				<a href="${previous}">
					<button class="btn btn-primary" type="submit">Return</button>
				</a>
			</div>

		</div>

		<div class="col-md-2"></div>
	</div>


</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.10/angular.js"></script>
<script
	src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.11.0.js"></script>
</html>
