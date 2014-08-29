var recipesApp = angular.module('recipesApp', [ 'ui.bootstrap' ]);

recipesApp.filter('startFrom', function() {
    return function(input, start) {
        if(input) {
            start = +start; //parse to int
            return input.slice(start);
        }
        return [];
    };
});

var ModalCtrl = function($scope, $modal, $log) {

	$scope.open = function(id) {
		var modalInstance = $modal.open({
			templateUrl : 'myModalContent_' + id + '.html',
			controller : ModalInstanceCtrl,
			resolve : {
				items : function() {
					return $scope.items;
				}
			}
		});

		modalInstance.result.then(function() {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};
};

var ModalInstanceCtrl = function($scope, $modalInstance) {

	$scope.ok = function() {
		$modalInstance.close('closed');
	};
};

var RecipesCtrl = function($scope, $http, filterFilter) {
	$scope.recipes = [];
	$scope.filtered = [];

	var responsePromise = $http.get("/recipesAJAX");
	responsePromise.success(function(data, status, headers, config) {
		$scope.recipes = data;
		$scope.numberOfItems = $scope.recipes.length;
		$scope.noOfPages = Math.ceil($scope.recipes.length
				/ $scope.entryLimit);
		$scope.filtered = $scope.recipes;
	});
	responsePromise.error(function(data, status, headers, config) {
		alert("AJAX failed!");
	});

	$scope.numberOfItems = $scope.recipes.length;
	$scope.currentPage = 1; // current page
	$scope.maxSize = 5; // pagination max size
	$scope.entryLimit = 7; // max rows for data table
	$scope.noOfPages = Math.ceil($scope.recipes.length / $scope.entryLimit);
	
	$scope.$watch('search', function(term) {
        $scope.filtered = filterFilter($scope.recipes, term);
        $scope.noOfPages = Math.ceil($scope.filtered.length/$scope.entryLimit);
        $scope.numberOfItems =  $scope.filtered.length;
    });
};