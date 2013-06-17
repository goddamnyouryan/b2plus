class B2plus.Views.Admin extends Backbone.View
  el: '.admin'

  initialize: ->
    $('.sort').sortable
      axis: 'y'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
