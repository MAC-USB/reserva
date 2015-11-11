'use strict';

describe('Controller: PrincipalCtrl', function () {

  // load the controller's module
  beforeEach(module('appApp'));

  var PrincipalCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    PrincipalCtrl = $controller('PrincipalCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(PrincipalCtrl.awesomeThings.length).toBe(3);
  });
});
