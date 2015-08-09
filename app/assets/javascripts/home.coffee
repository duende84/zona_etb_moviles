$ ->
  $('.alert').click ->
    $('.alert').hide('slow')
    return

  $('#btn_inicio').click ->
    $('#lista').hide('slow')
    $('#iconos').show('slow')
    return

  $('#btn_mecanica').click ->
    $('#iconos').hide('slow')
    $('#lista').show('slow')
    return

  $('#new_user').submit ->
    $.loader
      className: 'load'
      content: ''
    return