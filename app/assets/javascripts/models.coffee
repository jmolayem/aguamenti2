# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('i.glyphicon-thumbs-up, i.glyphicon-thumbs-down').click ->
    $this = $(this)
    c = $this.data('count')
    if !c
      c = 0
    c++
    $this.data 'count', c
    $('#' + @id + '-bs3').html c
    return
  $(document).delegate '*[data-toggle="lightbox"]', 'click', (event) ->
    event.preventDefault()
    $(this).ekkoLightbox()
    return
  return