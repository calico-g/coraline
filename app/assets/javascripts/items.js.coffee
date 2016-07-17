$(document).ready ->
  $.fn.datepicker.defaults.autoclose = true
  $('#datepicker').on 'changeDate', (event) ->
    u_date = $('input[name=u_date]').val()
    $.ajax
      type: 'GET'
      url: '/items'
      data: u_date: u_date
      success: (data) ->
        formData = $(data).find('#main-form')
        $('#main-form').replaceWith formData
        return
    return
  return