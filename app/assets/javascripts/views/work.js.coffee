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
    sublime.player('sublime-video').on 'end', =>
      @$el.find('.overlay').remove()

  triggerOverlay: (event) ->
    $(event.target).find('img.thumb').click()
