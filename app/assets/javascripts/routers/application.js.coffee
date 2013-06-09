class B2plus.Routers.Application extends Backbone.Router

  routes:
    '' : 'index'
    '': 'connect'
    '': 'work'

  initialize: ->
    new B2plus.Views.Global

  index: ->
    new B2plus.Views.Home

  connect: ->
    new B2plus.Views.Connect

  work: ->
    new B2plus.Views.Work
