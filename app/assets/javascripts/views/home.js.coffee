class B2plus.Views.Home extends Backbone.View
  el: '#container'

  initialize: ->
    @lazyLoadImages()

  lazyLoadImages: ->
    $('ul#work li').waypoint ->
      if $(this).css('background-image') == 'none'
        background = $(this).data('background')
        $(this).css('background', "url('#{background}') no-repeat")
    ,
      offset: $.waypoints('viewportHeight')
