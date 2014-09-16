var ingredientApp = angular.module('ingredientApp', ['ui.bootstrap']);

ingredientApp.filter('startFrom', function() {
    return function(input, start) {
        if(input) {
            start = +start; //parse to int
            return input.slice(start);
        }
        return [];
    };
});

ingredientApp.controller('ingredientCtrl', function($scope, $http, $timeout, filterFilter){
    $scope.ingredients = [];
    $scope.oneAtATime = true;
    
	var responsePromise = $http.get("/ingredientsAJAX");
	responsePromise.success(function(data, status, headers, config) {
		$scope.ingredients = data;
		$scope.filtered = data;
		$scope.numberOfItems = $scope.ingredients.length;
		$scope.noOfPages = Math.ceil($scope.ingredients.length/$scope.entryLimit);
	});
	responsePromise.error(function(data, status, headers, config) {
		alert("AJAX failed!");
	});
	
	$scope.numberOfItems = $scope.ingredients.length;
    $scope.currentPage = 1; //current page
    $scope.maxSize = 5; //pagination max size
    $scope.entryLimit = 10; //max rows for data table

    /* init pagination with $scope.list */
    $scope.noOfPages = Math.ceil($scope.ingredients.length/$scope.entryLimit);
    
    $scope.$watch('search', function(term) {
        // Create $scope.filtered and then calculat $scope.noOfPages, no racing!
        $scope.filtered = filterFilter($scope.ingredients, term);
        $scope.noOfPages = Math.ceil($scope.filtered.length/$scope.entryLimit);
        $scope.numberOfItems =  $scope.filtered.length;
    });
});