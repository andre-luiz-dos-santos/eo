'use strict'

angular.module('esperantoProgramo.paĝoj.pri', [
  'ui.bootstrap'
  'esperantoProgramo.navbar'
])

.config ($routeProvider) ->
  $routeProvider
    .when '/pri',
      templateUrl: 'paĝoj/pri/index.html'
      controller: 'PriController'
  return

.controller 'PriController', ($scope) ->
  $scope.menu = [
    ['Radikoj', '#/radikoj']
    ['Ligiloj', '#/ligiloj']
  ]
  return
