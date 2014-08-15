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
    $scope.changedIngredients = [];
    
	var responsePromise = $http.get("/ingredientsAJAX");
	responsePromise.success(function(data, status, headers, config) {
		$scope.ingredients = data;
		$scope.changedIngredients = data;
	});
	responsePromise.error(function(data, status, headers, config) {
		alert("AJAX failed!");
	});
	
	  $scope.totalItems = $scope.changedIngredients;
	  $scope.currentPage = 1;
	  
	  $scope.$watch('change', function(){
		  $scope.currentPage = 1;
		  $scope.changedIngredients = $filter('filter')(ingredients, $scope.change);
		  $scope.totalItems = $scope.changedIngredients;
	  });
	  
	  $scope.maxSize = 5;
});