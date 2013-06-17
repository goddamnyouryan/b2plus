class B2plus.Views.Work extends Backbone.View
  el: '#work'

  template: JST['video']

  initialize: ->
    sublime.load()
    skrollr.init
      smoothScrolling: true

  events: ->
    'click img.thumb': 'playVideoInOverlay'
    'click .width': 'triggerOverlay'

  playVideoInOverlay: (event) ->
    target = $(event.target)
    template = @template
      mp4: target.data('mp4')
      ogg: target.data('ogg')
      thumb: target.data('thumb')
    overlay = new B2plus.Views.Overlay
      el: @el
      content: template
    overlay.render()
    sublimevideo.prepareAndPlay('sublime-video')
    if $(window).width() < 1000
      width = $(window).width() - 50
      height = width / 1.78
      sublimevideo.resize('sublime-video', width, height)
    sublime.player('sublime-video').on 'end', =>
      @$el.find('.overlay').remove()

  triggerOverlay: (event) ->
    $(event.target).find('img.thumb').click()
