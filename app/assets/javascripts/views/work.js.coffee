class B2plus.Views.Work extends Backbone.View
  el: '#work'

  template: JST['video']

  initialize: ->
    sublime.load()
    skrollr.init
      smoothScrolling: true
    @waypoints()

  events: ->
    'click img.thumb': 'playVideoInOverlay'

  waypoints: ->
    @$el.find('li').first().waypoint (direction) ->
      if direction == 'down'
        $(this).addClass 'noshadow'
        $('header').after '<div class="shadow"></div>'
      else
        $(this).removeClass 'noshadow'
        $('.shadow').remove()
    ,
    offset: 110


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
