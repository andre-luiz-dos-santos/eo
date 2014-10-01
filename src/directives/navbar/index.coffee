'use strict'

angular.module('esperantoProgramo.navbar', [
  'ui.bootstrap'
])

.filter 'eoNavbar', ->
  (menu) ->
    for item in menu
      if angular.isArray(item)
        _.extend {}, (item[3] ? {}),
          name: item[0] ? 'Nenomita'
          link: item[1] ? ''
          active: item[2] ? false
      else
        _.defaults item,
          name: 'Nenomita'
          link: ''
          active: false

.directive 'eoNavbar', ($filter) ->
  scope:
    title: '@eoTitle'
    menu: '=eoMenu'
  templateUrl: 'directives/navbar/index.html'
  link: (scope, element, attrs) ->
    scope.isCollapsed = true
    scope.$watch 'menu', (newValue, oldValue) ->
      scope.filteredMenu = $filter('eoNavbar')(newValue)
      return
    return
