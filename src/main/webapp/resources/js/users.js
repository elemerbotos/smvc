var userApp = angular.module('userApp', ['ui.bootstrap']);

userApp.filter('startFrom', function() {
    return function(input, start) {
        if(input) {
            start = +start; //parse to int
            return input.slice(start);
        }
        return [];
    };
});

userApp.controller('userCtrl', function($scope, $http, $timeout, filterFilter){
    $scope.users = [];
    $scope.oneAtATime = true;
    
	var responsePromise = $http.get("/usersAJAX");
	responsePromise.success(function(data, status, headers, config) {
		$scope.users = data;
		$scope.filtered = data;
		$scope.numberOfItems = $scope.users.length;
		$scope.noOfPages = Math.ceil($scope.users.length/$scope.entryLimit);
	});
	responsePromise.error(function(data, status, headers, config) {
		alert("AJAX failed!");
	});
	
	$scope.numberOfItems = $scope.users.length;
    $scope.currentPage = 1; //current page
    $scope.maxSize = 5; //pagination max size
    $scope.entryLimit = 5; //max rows for data table

    /* init pagination with $scope.list */
    $scope.noOfPages = Math.ceil($scope.users.length/$scope.entryLimit);
    
    $scope.$watch('search', function(term) {
        // Create $scope.filtered and then calculat $scope.noOfPages, no racing!
        $scope.filtered = filterFilter($scope.users, term);
        $scope.noOfPages = Math.ceil($scope.filtered.length/$scope.entryLimit);
        $scope.numberOfItems =  $scope.filtered.length;
    });
});