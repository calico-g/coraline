$(document).ready(function() {
  $.fn.datepicker.defaults.autoclose = true;
  $("#datepicker").on("changeDate", function(event) {
    var u_date = $("input[name=u_date]").val();

    $.ajax({
      type: "GET",
      url: "/items",
      data: { u_date },
      success: function(data){
        var formData = $(data).find( '#main-form' )
        $( '#main-form' ).replaceWith( formData );
      }
    });
  });


});