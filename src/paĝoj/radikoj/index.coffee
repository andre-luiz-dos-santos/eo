'use strict'

angular.module('esperantoProgramo.paĝoj.radikoj', [
  'ui.bootstrap'
  'esperantoProgramo.navbar'
  'esperantoProgramo.datumo.vortoj'
])

.config ($routeProvider) ->
  $routeProvider
    .when '/radikoj',
      templateUrl: 'paĝoj/radikoj/index.html'
      controller: 'RadikojController'
  return

.controller 'RadikojController', ($scope, VortojResource) ->
  $scope.radikoj = VortojResource.query()
  $scope.menu = [
    ['Radikoj', '', true]
  ]
  return
