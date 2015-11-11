'use strict';

/**
 * @ngdoc function
 * @name appApp.controller:PrincipalCtrl
 * @description
 * # PrincipalCtrl
 * Controller of the appApp
 */
angular.module('appApp')
  .controller('PrincipalCtrl', function ($scope) {
    this.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
    $scope.test = "Paso la prueba"
  });
