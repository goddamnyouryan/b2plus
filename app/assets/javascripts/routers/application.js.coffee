class B2plus.Routers.Application extends Backbone.Router

  routes:
    '' : 'index'
    'admin': 'admin'
    ':id': 'scrollTo'

  initialize: ->
    new B2plus.Views.Global

  index: ->
    new B2plus.Views.Home
    new B2plus.Views.Connect
    new B2plus.Views.Work

  admin: ->
    new B2plus.Views.Admin

  scrollTo: (id) ->
    @index()
    work = $("##{id}").offset().top
    $('body').scrollTop work
