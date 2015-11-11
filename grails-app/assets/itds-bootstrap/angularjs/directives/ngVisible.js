angular.module("ItdsTools")
.directive('ngVisible', function() {
	return {
		replace:true,
		restrict:'A',
		link: function( scope, element, attrs ) {
			scope.$watch(attrs.ngVisible, function (visible) {
				element.css('visibility', visible ? 'visible' : 'hidden');
			});
		}
	};
});