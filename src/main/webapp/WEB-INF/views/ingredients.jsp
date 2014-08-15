<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html ng-app="ingredientApp">
<head>
<title>Home</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css">
</head>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="page-header">
				<h1>Ingredients</h1>

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
				<div class="col-md-9">
					<div class="container-fluid" ng-controller="ingredientCtrl">
						<div class="row">
							<div class="col-md-2">
								<!--Sidebar content-->

								Search: <input type="text" ng-model="search" placeholder="Search" /><br />

							</div>
							<br> <br> <br> <br>
							<div class="col-md-10">
								<!--Body content-->
								<br />
								<ul>
									<li
										ng-repeat="data in filtered = (ingredients | filter:search) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">{{data.name}}</li>
								</ul>
								
								<pre>The selected page no: {{currentPage}} {{totalItems}}</pre>
								<pagination boundary-links="true" total-items="totalItems"
									ng-model="currentPage" class="pagination-sm"
									previous-text="&lsaquo;" next-text="&rsaquo;"
									max-size="maxSize" num-pages="noOfPages"
									first-text="&laquo;" last-text="&raquo;"></pagination>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<br> <br> <br> <a href="/addIngredient">
						<button type="button" class="btn btn-default">Add new
							ingredient</button>
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

<script src="<c:url value="/resources/js/ingredient.js" />"></script>
</html>
