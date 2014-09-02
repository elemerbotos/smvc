<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html ng-app="recipesApp">
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
						<h1>Recipes</h1>
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

			<div class="row">
				<div class="col-md-4">
					<h2>Latest recipes</h2>
				</div>
				<div class="col-md-4">
					<div class="add_recipe_button">
						<a href="/addRecipe">
							<button type="button" class="btn btn-default">Add new
								recipe</button>
						</a>
					</div>
				</div>
				<div class="col-md-4">
					<h2>All recipes</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">

					<c:forEach var="recipe" items="${latestRecipes}">
						<div ng-controller="ModalCtrl">
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


									<th colspan="2">${recipe.name}</th>
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

					<div ng-controller="RecipesCtrl">
						
						<br> Search: <input type="text" ng-model="search"
							placeholder="Search" /><br /> <br>
						<div class="plate_background">
							<div class="recipe_list"
								ng-repeat="data in filt = (recipes | filter:search) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
								<a href="/recipe/{{data.id}}">{{data.name}}</a>
							</div>
						</div>

						<pagination data-boundary-links="true" total-items="numberOfItems"
							num-pages="noOfPages" ng-model="currentPage" max-size="maxSize"
							class="paginationsm" items-per-page="entryLimit"
							data-previous-text="&laquo;" data-next-text="&raquo;"></pagination>
					</div>
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

<script src="<c:url value="/resources/js/recipes.js" />"></script>
</html>
