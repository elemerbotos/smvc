var openInNewWindow = angular.module('openInNewWindow', ['ui.bootstrap']);


var ModalDemoCtrl = function($scope, $modal, $log) {

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

// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $modal service used above.

var ModalInstanceCtrl = function($scope, $modalInstance) {

	$scope.ok = function() {
		$modalInstance.close('closed');
	};
};