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

  $('#new_user').on 'ajax:success', (e, data, status) ->
    console.error('-----------   e   ', e)
    $.loader('close')
    $('#social_share').show('slow')
    return

  $('#new_user').on 'ajax:error', (e, data, status) ->
    console.error('-----------   data   ', data)
    $.loader('close')
    return

  $('#new_user').submit (e) ->
    if !$('#check_terms').is(':checked')
      alert 'Debes aceptar los términos y condiciones.'
      e.preventDefault()
    else
      $.loader
        className: 'load'
        content: ''
    return

  $('#term1').click ->
    $('#terms').show('slow')
    return

  $('#term2').click ->
    $('#terms').show('slow')
    return

  $('#terms').click ->
    $('#terms').hide('slow')
    return

  $('#social_share').click ->
    $('#social_share').hide('slow')
    return