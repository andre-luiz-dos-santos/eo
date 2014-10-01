'use strict'

angular.module('esperantoProgramo.datumo.lingvoj')

.factory 'LingvojResource', ($resource, LingvojHttpCache) ->
  $resource 'datumo/lingvoj/files/:lingvo.json', null,
    get:
      method: 'GET'
      cache: LingvojHttpCache
