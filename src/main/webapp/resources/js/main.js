var cookingApp = angular.module('cookingApp', []);

cookingApp.controller('RecipeCtrl', function($scope, $location, $window) {

	$scope.ingredients = [];

	$scope.addToList = function(ingredient, quantity) {
		if (ingredient == undefined || quantity == undefined
				|| ingredient === "" || quantity == "") {
			alert("Ingredient or quantity missing!");
		} else {
			var properties = ingredient.split(', ');
			var obj = {};
			properties.forEach(function(property) {
				var tup = property.split(':');
				obj[tup[0]] = tup[1];
			});
			$scope.ingredients.push({
				'id' : obj.id,
				'quantity' : quantity,
				'name' : obj.name
			});
		}
	};

	$scope.sendIngredients = function() {
		var patt = /[^<>]+/;
		if ($scope.ingredients.length == 0) {
			alert("No ingredient!");
		} else if ($scope.desc == undefined) {
			alert("Empty description!");
		} else if ($scope.name == undefined) {
			alert("Empty name!");
		} else if ($scope.username == undefined) {
			alert("Not identified name!");
		} else if ($scope.category == undefined) {
			alert("Empty category!");
		} else {
			$scope.desc = $scope.desc.replace(/(<([^>]+)>)/ig,"");
			$scope.name = $scope.name.replace(/(<([^>]+)>)/ig,"");
			$.post("/addNewRecipe", {
				recipe : JSON.stringify({
					name : $scope.name,
					desc : $scope.desc,
					author : $scope.username,
					category : $scope.category,
					ingreds : $scope.ingredients
				})
			}).done(function(data) {
				alert("Recipe succesfully saved!");
				$window.location.href = '/recipes';
			});
		}
	};

	$scope.removeIngredient = function(index) {
		$scope.ingredients.splice(index, 1);
	};

});