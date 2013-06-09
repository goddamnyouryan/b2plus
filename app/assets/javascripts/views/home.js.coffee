class B2plus.Views.Home extends Backbone.View
  el: '#container'

  events: ->
    'click img.animation': 'playVideo'

  playVideo: ->
    if @play
      sublimevideo.pause('intro-video')
      @play = false
    else
      sublimevideo.play('intro-video')
      @play = true
