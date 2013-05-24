class B2plus.Views.Connect extends Backbone.View
  el: '.connect'

  map: JST['map']
  form: JST['contact_form']

  events: ->
    'click .address': 'openMap'
    'click .contact-form': 'openEmail'
    'click .close': 'hideOverlay'
    'submit .contact': 'sendContactEmail'

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

  sendContactEmail: (event) ->
    event.preventDefault()
    target = $(event.target)
    params = {
      name: target.find('#name').val()
      email: target.find('#email').val()
      message: target.find('#message').val()
    }
    if params.name and params.email and params.message
      target.find('#submit').attr('value', 'Sending...').attr('disabled', true)
      @sendEmail(params, target)
    else
      alert 'Please fill out all the fields.'

  sendEmail: (params, target) ->
    $.ajax
      type: 'POST'
      url: target.attr('action')
      data: params
      success: =>
        @hideOverlay()
        html = '<div class="flash">Your Message has been sent! We\'ll get back to you shortly.</div>'
        @$el.prepend html
