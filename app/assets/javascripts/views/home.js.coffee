class B2plus.Views.Home extends Backbone.View
  el: '#container'

  initialize: ->
    @lazyLoadImages()

  events: ->
    'click .intro-play-button': 'playIntroVideo'

  lazyLoadImages: ->
    $('ul#work li').waypoint ->
      if $(this).css('background-image') == 'none'
        background = $(this).data('background')
        $(this).css('background', "url('#{background}') no-repeat center")
    ,
      offset: $.waypoints('viewportHeight')

  playIntroVideo: (event) ->
    target = $(event.target)
    event.preventDefault()
    sublimevideo.prepareAndPlay 'intro-video'
    target.hide()
