<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html ng-app="userApp">
<head>
<title>Home</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="page-header">
				<h1>Users <a href="/j_spring_security_logout">
						<button type="submit" class="btn btn-default">
							<i class="glyphicon glyphicon-log-out"></i> Log out
						</button>
					</a></h1>

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
					<div class="container-fluid" ng-controller="userCtrl">
					
						<div class="row">
							<div class="col-md-2">
								<!--Sidebar content-->

								Search: <input type="text" ng-model="search"
									placeholder="Search" /><br />

							</div>
							<br> <br> <br> <br>
							<div class="col-md-10">
								<!--Body content-->
								<br />
								<accordion close-others="oneAtATime">
									<accordion-group heading="{{data.name}}" ng-repeat="data in changedUsers = (users | filter:search) | startFrom:(currentPage-1)*entryLimit | limitTo:entryLimit">
      									{{data.description}}
    								</accordion-group>
								</accordion>

								<pagination data-boundary-links="true"
									total-items="numberOfItems" num-pages="noOfPages"
									ng-model="currentPage" max-size="maxSize" class="paginationsm"
									items-per-page="entryLimit" data-previous-text="&laquo;"
									data-next-text="&raquo;"></pagination>
								<pre>The selected page no: {{currentPage}} of {{noOfPages}}</pre>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					
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