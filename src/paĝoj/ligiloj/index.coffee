'use strict'

angular.module('esperantoProgramo.paĝoj.ligiloj', [
  'ui.bootstrap'
  'esperantoProgramo.navbar'
])

.config ($routeProvider) ->
  $routeProvider
  .when '/ligiloj',
    templateUrl: 'paĝoj/ligiloj/index.html'
    controller: 'LigilojController'
  return

.controller 'LigilojController', ($scope) ->
  $scope.menu = [
    ['Ligiloj', '', true]
  ]
  return
