angular.module("ItdsTools")
	.directive('ngOnescape', function() {
		return {
			restrict:'A',
			scope: {
				ngOnescape: "&"
			},
			link: function($scope, $element, $attrs) {
				$element.bind('keyup', function(event) {
					if (event.keyCode == 27) {
						$scope.$apply(function() {
							$scope.ngOnescape();
						});
					}
				});
			}
		}
	});