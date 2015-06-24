#= require jquery
#= require jquery_ujs
#= require bootstrap

$ ->
  $('.enqueue-button').click (e) ->
    e.preventDefault()
    path = $(this).attr('href')
    $.when(send_planes(path))
    .then ->
      window.location = '/'

  $('.add-plane-for-enqueue').click (e) ->
    e.preventDefault()
    new_plane = $('.plane-for-enqueue-item').first().clone()
    $('.planes-for-enqueue').append(new_plane)

  send_planes = (path) ->
    ids = []
    $('.planes-for-enqueue .enqueue-plane-form').each ->
      ids.push $(this).find('#plane_id').val()
    $.post path, {
      ids: ids
    }, (data, status) ->
      console.log('planes sended')
      return

  $(document).on 'click', '.delete-enqueue-block', (e) ->
    e.preventDefault()
    $(this).closest('.plane-for-enqueue').remove()
