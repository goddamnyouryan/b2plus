class B2plus.Views.Home extends Backbone.View
  el: '#container'

  initialize: ->
    @lazyLoadImages()

  events: ->
    'click img.animation': 'playVideo'

  playVideo: ->
    if @play
      sublimevideo.pause('intro-video')
      @play = false
    else
      sublimevideo.play('intro-video')
      @play = true

  lazyLoadImages: ->
    $('ul#work li').waypoint ->
      if $(this).css('background-image') == 'none'
        background = $(this).data('background')
        $(this).css('background', "url('#{background}') no-repeat")
    ,
      offset: $.waypoints('viewportHeight')
