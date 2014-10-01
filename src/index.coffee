'use strict'

angular.module('esperantoProgramo', [
  'ngRoute'
  'esperantoProgramo.disqus'
  'esperantoProgramo.paĝoj.pri'
  'esperantoProgramo.paĝoj.radikoj'
  'esperantoProgramo.paĝoj.afiksoj'
])

.config ($routeProvider) ->
  $routeProvider
    .otherwise
      redirectTo: '/pri'
  return
