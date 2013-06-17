class B2plus.Views.Global extends Backbone.View
  el: 'body'

  initialize: ->
    @makeSublimeFluid() if $(window).width() < 1000
    @resizeSublime() if $(window).width() < 1000
    @redirectForMobile()

  events: ->
    'click .scroll': 'smoothScroll'

  redirectForMobile: ->
    if $(window).width() < 1000
      window.location.hash = 'intro'

  smoothScroll: (event) ->
    event.preventDefault()
    target = $(event.target)
    hash = target.attr('href')
    if hash == '#work'
      offset = 111
    else
      offset = 136
    scrollTarget = $("#{hash}").offset().top - offset
    $('html,body').animate({scrollTop: scrollTarget},{easing: 'linear', duration: 1000})

  makeSublimeFluid: ->
    $(window).resize =>
      width = $(window).width() - 50
      height = width / 1.78
      sublimevideo.resize('intro-video', width, height)

  resizeSublime: ->
    width = $(window).width() - 50
    height = width / 1.78
    sublime.ready ->
      sublimevideo.resize('intro-video', width, height)
