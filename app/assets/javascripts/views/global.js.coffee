class B2plus.Views.Global extends Backbone.View
  el: 'body'

  events: ->
    'click .scroll': 'smoothScroll'

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
