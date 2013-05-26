class B2plus.Routers.Application extends Backbone.Router

  routes:
    '' : 'index'
    'connect': 'connect'
    'work': 'work'

  index: ->
    new B2plus.Views.Home

  connect: ->
    new B2plus.Views.Connect

  work: ->
    new B2plus.Views.Work
