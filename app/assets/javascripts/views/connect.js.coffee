class B2plus.Views.Connect extends Backbone.View
  el: '.connect'

  map: JST['map']
  form: JST['contact_form']

  events: ->
    'click .address': 'openMap'
    'click .contact-form': 'openEmail'
    'click .close': 'hideOverlay'

  openMap: ->
    @openOverlay()
    @$el.find('.overlay-content').html @map()

  openEmail: (event) ->
    event.preventDefault()
    @openOverlay()
    @$el.find('.overlay-content').html @form()

  openOverlay: ->
    @$el.find('.overlay').show()

  hideOverlay: ->
    overlay = @$el.find('.overlay')
    overlay.hide()
    overlay.find('.overlay-content').html ''
