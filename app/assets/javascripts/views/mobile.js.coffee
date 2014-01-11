class B2plus.Views.Mobile extends Backbone.View

  events: ->
    'click h2.archive': 'toggleArchive'

  archive: ->
    @$('#archive ul')

  toggleArchive: ->
    if @archive().is ':visible'
      @archive().slideUp()
    else
      @archive().slideDown()
