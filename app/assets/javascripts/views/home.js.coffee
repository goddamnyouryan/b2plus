class B2plus.Views.Home extends Backbone.View
  el: '#container'

  events: ->
    'click img.animation': 'playVideo'

  initialize: ->
    @frame = 2
    @maxFrames = 52
    @img = $('img.animation')
    @waypoints()

  waypoints: ->
    @$el.find('#animation').waypoint (direction) =>
      if direction == 'down'
        @setVariables()
        $(document).on 'scroll', () => @animate()
      else
        $(document).off 'scroll'
    ,
    offset: $(window).height() - 100

  animate: ->
    progress = @distance()
    @frame = parseInt(((@limit - progress) / @interval).toFixed())
    if @frame >= @maxFrames
      @frame = @maxFrames
    if @frame <= 1
      @frame = 1
    src = "/assets/intro-animation/intro-animation-#{@frame}.png"
    @img.attr('src', src)

  distance: ->
    $('#animation').offset().top - $(document).scrollTop()

  setVariables: ->
    @trigger = @distance()
    @limit = @distance() + 100
    @interval = parseInt(($(window).height() / @maxFrames).toFixed())

  playVideo: ->
    if @play
      sublimevideo.pause('intro-video')
      @play = false
    else
      sublimevideo.play('intro-video')
      @play = true
