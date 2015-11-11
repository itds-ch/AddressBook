'use strict';

angular.module('ItdsTools')
	.directive('inlineEditTextarea', function ($http, $timeout) {
		return {
			template: '\
				<span class="itds-angular-tools-inline-edit-textarea"> \
					<span class="itds-angular-tools-inline-edit-textarea-display" ng-click="enableEditor($event)" ng-hide="editorEnabled"> \
						<span ng-bind="value"></span> \
						<i class="itds-angular-tools-inline-edit-textarea-toggle icon-pencil"> </i> \
					</span> \
					<span class="itds-angular-tools-inline-edit-textarea-editor" ng-show="editorEnabled"> \
						<form ng-submit="save()" ng-onescape="disableEditor($event)">  \
							<textarea ng-model="editValue"></textarea> \
						</form>  \
						<button class="btn itds-angular-tools-inline-edit-textarea-save"  ng-click="save()"> \
							<i class="icon-save"></i> \
							<span ng-bind="saveText"></span> \
						</button> \
							<button class="btn itds-angular-tools-inline-edit-textarea-cancel" ng-click="disableEditor($event)"> \
							<i class="icon-ban-circle"></i> \
							<span ng-bind="cancelText"></span> \
						</button> \
					</span> \
				</span>',
			restrict:'E', // for ie 8 put <script>document.createElement('inline-edit-textarea');</script> in head, or use 'A' notation
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
						$element.find("textarea")[0].focus()
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
