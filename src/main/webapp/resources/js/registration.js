var registrationApp = angular.module('registrationApp', [ 'ui.bootstrap' ]);

var registrationCtrl = registrationApp.controller('registrationCtrl',
	function($scope, $http, $timeout, filterFilter) {
		$scope.usernames = [];
		$scope.alerts = [];

		var responsePromise = $http.get("/userNamesAJAX");
		responsePromise.success(function(data, status, headers, config) {
			$scope.usernames = data;
		});
		responsePromise.error(function(data, status, headers,
				config) {
			alert("AJAX failed!");
		});

		$scope
				.$watch(
						'input',
						function(username) {
							if ($scope.usernames.indexOf(username) > -1) {
								if ($scope.alerts.length == 0) {
									$scope.alerts.push({
												type : 'danger',
												msg : 'Already existing username!'
											});
								}
							} else {
								$scope.alerts = [];
							}
						});
	});