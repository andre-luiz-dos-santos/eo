'use strict'

angular.module('esperantoProgramo.datumo.vortoj')

.factory 'VortojResource', ($resource, LingvojListo, VortojHttpCache) ->
  $resource 'datumo/vortoj/files/:radiko.json', null,
    query:
      method: 'GET'
      url: 'datumo/vortoj/index.json'
      isArray: true
      cache: VortojHttpCache
    get:
      method: 'GET'
      cache: VortojHttpCache
      interceptor:
        response: (response) ->
          resource = response.resource
          _.defaults resource,
            radiko: ''
            vortoj: []
          for vorto in resource.vortoj
            _.defaults vorto,
              prefikso: ''
              radiko: resource.radiko
              sufikso: ''
              tradukoj: {}
            vorto.tradukoj =
              for lingvo, traduko of vorto.tradukoj
                signifoj: _.flatten([traduko])
                lingvo: LingvojListo.addNomo(lingvo)
            # Sort translations based on language name.
            vorto.tradukoj = _.sortBy vorto.tradukoj, (i) -> i.lingvo.nomo
          # Sort words based on 'prefikso' and 'sufikso'.
          # Single-letter 'sufikso' on top.
          resource.vortoj = _.sortBy resource.vortoj, (i) ->
            [ (if i.sufikso.length is 1 then '0'+i.sufikso else '1 '),
              i.prefikso, i.sufikso ].join("\0")
          resource.lingvoj = LingvojListo.popAll()
          return response.data
