'use strict'

angular.module('esperantoProgramo.paĝoj.afiksoj', [
  'ngRoute'
  'ui.bootstrap'
  'esperantoProgramo.navbar'
  'esperantoProgramo.datumo.vortoj'
])

.config ($routeProvider) ->
  $routeProvider
    .when '/afiksoj/:radiko',
      templateUrl: 'paĝoj/afiksoj/index.html'
      controller: 'AfiksojController'
  return

.controller 'AfiksojController', ($scope, $routeParams, VortojResource) ->
  $scope.datumoj = VortojResource.get
    radiko: $routeParams.radiko
  $scope.menu = [
    ['Radikoj', '#/radikoj']
    [$routeParams.radiko, '', true]
  ]
  return
