class B2plus.Views.Mobile extends Backbone.View

  events: ->
    'click h2.archive': 'toggleArchive'

  archive: ->
    @$('ul#archive')

  toggleArchive: ->
    if @archive().is ':visible'
      @archive().slideUp()
    else
      @archive().slideDown()
