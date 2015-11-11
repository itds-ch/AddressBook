'use strict';

angular.module('ItdsTools')
	.directive('inlineEditForm', function ($http, $timeout, $rootScope) {
		//TODO: support ng-model
		return {
			restrict:'E', // für ie 8 im head <script>document.createElement('inline-edit-form');</script> einfügen, oder A Schreibweise benutzen
			scope:{
				action: "@",
				method: "@?",
				enctype: "@?",
				parameters: "=?"
			},
			controller: function($scope, $element, $attrs) {
				//default values from http://www.w3.org/TR/html401/interact/forms.html#h-17.3
				if (typeof $attrs.method === "undefined") { $attrs.method = 'GET'; }
				if (typeof $attrs.enctype === "undefined") {$attrs.enctype = "application/x-www-form-urlencoded"; }

				var addParameters = function(args) {
					var submitArgs = {};
					if(typeof $scope.parameters === "object") {
						angular.forEach($scope.parameters, function (value, name) {
							submitArgs[name] = value;
						});
					}
					angular.forEach(args, function(value, name) {
						submitArgs[name] = value;
					});
					return submitArgs;
				};

				var urlEncode = function(args) {
					var formData = "";
					if(typeof args === "object") {
						angular.forEach(args, function(value, name) {
							if(formData !== "") {
								formData += "&";
							}
							formData += name + "=" + encodeURIComponent(value);
						});
					}
					return formData;
				};

				//api
				this.submit = function(args) {
					var submitArgs = addParameters(args);
					var httpConfig = {method: $scope.method, url: $scope.action};

					if(httpConfig.method.toUpperCase() === "POST" && $scope.enctype.toLowerCase() === "application/x-www-form-urlencoded") {
						httpConfig.headers = {'Content-Type': 'application/x-www-form-urlencoded'};
						httpConfig.data = urlEncode(submitArgs);
					} else if(httpConfig.method === "GET") {
						httpConfig.url = httpConfig.url + "?" + urlEncode(submitArgs);
					} //TODO: other enctypes

					//return promise for further error handling
					return $http(httpConfig).success(function(data, status, headers, config) {
						$rootScope.$broadcast("inline-edit-form-success", {data:data, status:status, headers:headers,config:config});
					}).error(function(data, status, headers, config) {
						$rootScope.$broadcast("inline-edit-form-error", {data:data, status:status, headers:headers,config:config});
					});
				};
			}
		};
	});
