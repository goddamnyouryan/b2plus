window.B2plus =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new B2plus.Routers.Application
    Backbone.history.start( pushState: true )

$(document).ready ->
  B2plus.initialize()
