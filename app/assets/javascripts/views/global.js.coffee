class B2plus.Views.Global extends Backbone.View
  el: 'body'

  initialize: ->
    # @makeSublimeFluid() if $(window).width() < 1000
    # @resizeSublime() if $(window).width() < 1000

  events: ->
    'click .scroll': 'smoothScroll'

  smoothScroll: (event) ->
    event.preventDefault()
    target = $(event.target)
    hash = target.attr('href')
    scrollTarget = $("#{hash}").offset().top - @offset(hash)
    $('html,body').animate({scrollTop: scrollTarget},{easing: 'linear', duration: 1000})

  offset: (hash) ->
    if $(window).width() < 1000
      0
    else if hash == '#work'
      111
    else
      136

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
