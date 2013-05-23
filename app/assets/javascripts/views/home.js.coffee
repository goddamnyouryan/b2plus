class B2plus.Views.Home extends Backbone.View

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
        console.log 'on'
      else
        $(document).off 'scroll'
        console.log 'off'
    ,
    offset: $(window).height() - 100

  animate: ->
    progress = @distance()
    if progress < @trigger
      @trigger = @trigger - @interval
    unless @frame >= @maxFrames
      @frame++
      src = "/assets/intro-animation/intro-animation-#{@frame}.png"
      @img.attr('src', src)

  distance: ->
    $('#animation').offset().top - $(document).scrollTop()

  setVariables: ->
    @trigger = @distance()
    @interval = parseInt(($(window).height() / 52).toFixed())
