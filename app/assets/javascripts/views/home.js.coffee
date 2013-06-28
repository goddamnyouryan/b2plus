class B2plus.Views.Home extends Backbone.View
  el: '#container'

  initialize: ->
    @lazyLoadImages() if $(window).width() > 801

  events: ->
    'click .intro-play-button': 'playIntroVideo'

  lazyLoadImages: ->
    $('ul#work li').waypoint ->
      if $(this).css('background-image') == 'none'
        background = $(this).data('background')
        $(this).css('background', "url('#{background}') no-repeat 50% -380px")
    ,
      offset: $.waypoints('viewportHeight') + 1000

  playIntroVideo: (event) ->
    target = $(event.target)
    event.preventDefault()
    sublimevideo.prepareAndPlay 'intro-video'
    target.hide()
