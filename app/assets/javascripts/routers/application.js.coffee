class B2plus.Routers.Application extends Backbone.Router

  routes:
    '' : 'index'

  initialize: ->

  index: ->
    new B2plus.Views.Home
