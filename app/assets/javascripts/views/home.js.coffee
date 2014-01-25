class B2plus.Views.Home extends Backbone.View
  el: '#container'

  initialize: ->
    @lazyLoadImages() if $(window).width() > 801

  events: ->
    'click .intro-play-button': 'playIntroVideo'
    'click .down': 'scrollToNext'
    'click .top': 'scrollToTop'

  lazyLoadImages: ->
    $('ul#work li').waypoint ->
      if $(this).css('background-image') == 'none'
        background = $(this).data('background')
        $(this).css('background', "url('#{background}') no-repeat 50% -170px")
    ,
      offset: $.waypoints('viewportHeight') + 1000

  playIntroVideo: (event) ->
    target = $(event.target)
    event.preventDefault()
    sublimevideo.prepareAndPlay 'intro-video'
    target.hide()

  scrollToNext: (event) ->
    event.preventDefault()
    target = $(event.target)
    @scrollableElements().each (index, element) =>
      if element == @scrollableElements().last()[0]
        target.addClass 'top'
        target.removeClass 'down'
      @next = $(element).offset().top
      if @scrollDistance() < @next
        @scrollTo @nextDistance()
        return false

  scrollToTop: (event) ->
    event.preventDefault()
    target = $(event.target)
    target.removeClass 'top'
    target.addClass 'down'
    @scrollTo 0

  scrollTo: (distance) ->
    $('html,body').animate({scrollTop: distance},{easing: 'swing', duration: 500})

  scrollDistance: ->
    $(window).scrollTop() + @topOffset()

  topOffset: ->
    $('header').outerHeight()

  nextDistance: ->
    @next - @topOffset()

  scrollableElements: ->
    $('ul#work li, #archive, ul#team, #connect')
