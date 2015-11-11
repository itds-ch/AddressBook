'use strict';

angular.module('ItdsTools')
	.directive('inlineEditText', function ($http, $timeout) {
		//TODO: support ng-model
		return {
			template: '\
				<span class="itds-angular-tools-inline-edit-text"> \
					<span class="itds-angular-tools-inline-edit-text-display" ng-click="enableEditor($event)" ng-visible="!editorEnabled"> \
						<span ng-bind="value"></span> \
						<i class="itds-angular-tools-inline-edit-text-toggle icon-pencil"> </i> \
					</span> \
					<span class="itds-angular-tools-inline-edit-text-editor" ng-show="editorEnabled"> \
						<form ng-submit="save()" ng-onescape="disableEditor($event)">  \
							<input ng-model="editValue"> \
						</form>  \
						<button class="btn itds-angular-tools-inline-edit-text-save"  ng-click="save()"> \
							<i class="icon-save"></i> \
							<span ng-bind="saveText"></span> \
						</button> \
							<button class="btn itds-angular-tools-inline-edit-text-cancel" ng-click="disableEditor($event)"> \
							<i class="icon-ban-circle"></i> \
							<span ng-bind="cancelText"></span> \
						</button> \
					</span> \
				</span>',
			restrict:'E', // für ie 8 im head <script>document.createElement('inline-edit-text');</script> einfügen, oder A Schreibweise benutzen
			replace:true,
			require: "^inlineEditForm",
			scope:{
				value: "@",
				postUrl: "@",
				name: "@",
				saveText: "@?",
				cancelText: "@?"
			},
			link: function($scope, $element, attrs, formCtrl) {
				$scope.editValue = $scope.value;
				$scope.editorEnabled = false;

				if (typeof attrs.saveText === "undefined") { attrs.saveText = 'Speichern'; }
				if (typeof attrs.cancelText === "undefined") { attrs.cancelText = "Abbrechen"; }

				$scope.disableEditor = function() {
					$scope.editorEnabled = false;
				};

				$scope.enableEditor = function() {
					$scope.editorEnabled = true;
					$timeout(function() {
						$element.find("input")[0].focus()
					});
				};

				$scope.save = function() {
					var submitValue = $scope.editValue;
					var oldValue = $scope.value;

					//optimistic success -> handle errors after failure
					$scope.disableEditor();
					$scope.value = $scope.editValue;

					var submitObj = {};
					submitObj[$scope.name] = submitValue;

					formCtrl.submit(submitObj).success(function(data, status, headers, config) {

					}).error(function(data, status, headers, config) {
						$scope.value = oldValue;
					});
				};
			}
		};
	});
