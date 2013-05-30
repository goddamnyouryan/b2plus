class B2plus.Views.Global extends Backbone.View
  el: 'body'

  events: ->
    'click .scroll': 'smoothScroll'

  smoothScroll: (event) ->
    event.preventDefault()
    target = $(event.target)
    hash = target.attr('href')
    scrollTarget = $("#{hash}").offset().top
    $('html,body').animate({scrollTop: scrollTarget},{easing: 'linear', duration: 1000})
