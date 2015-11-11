'use strict';

angular.module('ItdsTools')
	.controller('onescape', function ($scope) {
		$scope.val = "foo";
		$scope.test= function() {
			$scope.val = "escape pressed";
		}
	});
