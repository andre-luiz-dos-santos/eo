'use strict'

angular.module('esperantoProgramo.datumo.lingvoj')

.factory 'LingvojFactory', (LingvojResource, NeagordeblaLingvo) ->
  nomo: (lingvoNomo) ->
    resource =
      nomo: lingvoNomo
      nometo: ''
      montru: lingvoNomo is NeagordeblaLingvo
    LingvojResource.get(lingvo:lingvoNomo).$promise.then (data) ->
      data = _.pick(data, 'nomo', 'nometo')
      _.extend(resource, data)
      # TODO
      # Ĉu '$digest' de Angular estas necesa ĉi tie?
      return
    return resource

.factory 'LingvojListo', (LingvojFactory) ->
  listo = []
  indekso = {}
  addNomo: (lingvoNomo) ->
    indekso[lingvoNomo] ?= do ->
      lingvo = LingvojFactory.nomo(lingvoNomo)
      listo.push(lingvo)
      return lingvo
  popAll: ->
    sorted = _.sortBy(listo, 'nomo')
    listo = []
    indekso = {}
    return sorted
