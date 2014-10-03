'use strict'

angular.module('esperantoProgramo', [
  'ngRoute'
  'esperantoProgramo.disqus'
  'esperantoProgramo.paĝoj.pri'
  'esperantoProgramo.paĝoj.radikoj'
  'esperantoProgramo.paĝoj.afiksoj'
  'esperantoProgramo.paĝoj.ligiloj'
])

.config ($routeProvider) ->
  $routeProvider
    .otherwise
      redirectTo: '/pri'
  return
