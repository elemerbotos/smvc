<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html ng-app="cookingApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.17/angular.min.js"></script>
<script src="<c:url value="/resources/js/main.js" />"></script>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body ng-controller="RecipeCtrl"
	ng-init="username='<sec:authentication property="name"/>'"
	class="the_best_background">
	<c:if test="${error}">
		<script type="text/javascript">
			alert("${errorMsg}");
		</script>
	</c:if>

	<c:if test="${categoryAdded}">
		<script type="text/javascript">
			alert("Category successfully added!");
		</script>
	</c:if>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="page-header">
				<div class="row">
					<div class="col-md-8">
						<h1>Add new recipe</h1>
					</div>
					<div class="col-md-4 logout">
						<a href="/j_spring_security_logout" class="btn btn-default"> <i
							class="glyphicon glyphicon-log-out"></i> Log out
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
				<a href="/addCategory" class="btn btn-default float-right"> Add
					new category </a>

				<form role="form">
					<div class="form-group">
						<label for="title">Title</label> <input ng-model="name"
							type="text" name="name" class="form-control" id="title"
							placeholder="Enter the title of the recipe" />
					</div>

					<div class="form-group">
						<label for="desc">Description</label>
						<textarea ng-model="desc" rows="10" cols="50" name="description"
							id="desc" class="form-control"
							placeholder="Enter the text of recipe" ></textarea>
					</div>

					<div class="form-group">
						<label for="category">Category</label> <select ng-model="category"
							name="category" id="category" class="form-control">
							<option selected disabled value="">Choose a category</option>
							<c:forEach var="category" items="${categories}">
								<option value="${category.id}">${category.name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group row" id="addIngreds">
						<div class="form-group col-md-4">
							<label for="ingred">Ingredient name</label> <select
								ng-model="ingredient" name="ingredients" id="ingred"
								class="form-control">
								<option selected disabled value="">Choose an ingredient<option>
								<c:forEach var="ingred" items="${ingredients}">
									<option value="id:${ingred.id}, name:${ingred.name}">${ingred.name}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group col-md-4">
							<label for="amount">Amount</label> <input type="number"
								ng-model="quantity" id="amount" class="form-control"
								placeholder="Set amount" required />
						</div>

						<div class="col-md-4">
							<label for="addToListButton">&nbsp;</label><input type="button"
								value="Add to list" ng-click="addToList(ingredient, quantity)"
								class="btn btn-default top-margin-50" id="addToListButton"/> 
							
							
							
							<input type="button" value="Send" ng-click="sendIngredients()"
							class="btn btn-default top-margin-50 float-right" />
						</div>
					</div>

				</form>

				<h2>Added ingredients:</h2>
				<table class="table table-striped">
					<tr>
						<th>Ingredient</th>
						<th>Amount</th>
						<th></th>
					</tr>
					<tr ng-repeat="ingredient in ingredients">
						<td>{{ingredient.name | lowercase}}</td>
						<td>{{ingredient.quantity}}</td>
						<td><input type="button" value="Remove ingredient"
							ng-click="removeIngredient($index)" class="btn btn-default" /></td>
					</tr>
				</table>
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
