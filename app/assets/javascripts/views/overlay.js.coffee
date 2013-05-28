class B2plus.Views.Overlay extends Backbone.View

  template: JST['overlay']

  initialize: (options) ->
    @content = options.content

  events: ->
    'click .close': 'hideOverlay'

  render: ->
    @$el.append @template(content: @content)

  hideOverlay: (event) ->
    event.preventDefault()
    overlay = @$el.find('.overlay').remove()
