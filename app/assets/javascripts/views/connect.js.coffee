class B2plus.Views.Connect extends Backbone.View
  el: '.connect'

  map: JST['map']
  form: JST['contact_form']

  events: ->
    'click .address': 'openMap'
    'click .contact-form': 'openEmail'
    'submit .contact': 'sendContactEmail'

  openMap: ->
    overlay = new B2plus.Views.Overlay
      content: @map()
      el: @el
    overlay.render()

  openEmail: (event) ->
    event.preventDefault()
    @overlay = new B2plus.Views.Overlay
      content: @form()
      el: @el
    @overlay.render()

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
        @$el.find('.overlay').remove()
        html = '<div class="flash">Your Message has been sent! We\'ll get back to you shortly.</div>'
        @$el.prepend html
