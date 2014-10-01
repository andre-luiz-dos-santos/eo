'use strict'

angular.module('esperantoProgramo.disqus', [])

.directive 'eoDisqus', ->
  scope:
    name: '@eoDisqus'
  templateUrl: 'directives/disqus/index.html'
  link: (scope, element, attrs) ->
    dsq = document.createElement('script')
    dsq.type = 'text/javascript'
    dsq.async = true
    dsq.src = '//' + scope.name + '.disqus.com/embed.js'
    document.head.appendChild(dsq)
    return
