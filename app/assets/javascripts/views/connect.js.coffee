class B2plus.Views.Connect extends Backbone.View
  el: '.connect'

  map: JST['map']

  events: ->
    'click .address': 'openMap'
    'click .close': 'hideOverlay'

  openMap: ->
    @openOverlay()
    @$el.find('.overlay-content').html @map()

  openOverlay: ->
    @$el.find('.overlay').show()

  hideOverlay: ->
    overlay = @$el.find('.overlay')
    overlay.hide()
    overlay.find('.overlay-content').html ''
