<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html ng-app="openInNewWindow">
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
				<h1>Recipes</h1>

				<div class="page-header"></div>
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


			<div class="row">
				<div class="col-md-6">
					<h2>Latest recipes</h2>
					<c:forEach var="recipe" items="${latestRecipes}">
						<div ng-controller="ModalDemoCtrl">
							<table class="table table-striped">

								<tr>

									<script type="text/ng-template"
										id="myModalContent_${recipe.id}.html">
       									<div class="modal-header">
            								<h3 class="modal-title">${recipe.name}</h3>
        								</div>
        								<div class="modal-body">
											<h4>Category:</h4>
											${recipe.category.name}
											<br><br><br>
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
											${recipe.description}
											

											<br>
											<br>
											Creation date and user: ${recipe.creation}, <i>${recipe.author.username}</i>
        								</div>
        								<div class="modal-footer">
            								<button class="btn btn-primary" ng-click="ok()">Close</button>
        								</div>
    								</script>


									<th colspan="2">Recipe name: ${recipe.name}</th>
								</tr>

								<tr>
									<td>Author: ${recipe.author.username}</td>
									<td>Category: ${recipe.category.name}</td>
								</tr>
								<tr>
									<td colspan="2">
										<button class="btn btn-default" ng-click="open(${recipe.id})"
											ng-model="recipe">Read recipe!</button>
									</td>
								</tr>
							</table>


						</div>
					</c:forEach>

				</div>

				<div class="col-md-6">
					<br> <br> <br> <a href="/addRecipe">
						<button type="button" class="btn btn-default">Add new
							recipe</button>
					</a> <br> <br> <br> <br>
					<!-- 					<a href="/addRecipe"> -->
					<!-- 						<button type="button" class="btn btn-default">Add new -->
					<!-- 							recipe</button> -->
					<!-- 					</a> -->
				</div>
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

<script src="<c:url value="/resources/js/newWindow.js" />"></script>
</html>
