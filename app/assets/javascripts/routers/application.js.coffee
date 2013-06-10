class B2plus.Routers.Application extends Backbone.Router

  routes:
    '' : 'index'

  initialize: ->
    new B2plus.Views.Global

  index: ->
    new B2plus.Views.Home
    new B2plus.Views.Connect
    new B2plus.Views.Work
