function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
  $('.datepicker').datepicker('option', 'dateFormat', 'dd-mm-yy');
  $(".timepicker").timepicker({"timeformat": "h:i: A"})
}

function make_email_required(){
  debugger;
  var attr = $('.email').prop('required');

  if ($('#email_notify').is(':checked')) {
    if (typeof attr === 'undefined' || attr === false){
      $('.email').prop('required', 'required');
    }
  } else {
    $('.email').prop('required', false);
  }
}

function make_phone_required(){
  var attr = $('.mobile_phone').prop('required');

  if ($('#mobile_notify').is(':checked')) {
    if (typeof attr === 'undefined' || attr === false){
      $('.mobile_phone').prop('required', 'required');
    }
  } else {
    $('.mobile_phone').prop('required', false);
  }
}

function validate_start_end_dates(){
  var result = true;
  $(".start_date").each(function () {
    // if the next sibling has a value check it is later than the value of this.
    if ($(this).siblings('.end_date').datepicker('getDate') != null) {
      if ($(this).datepicker('getDate') > $(this).siblings('.end_date').datepicker('getDate')) {
        result = false;
        return result;
      }
    }
  });
  return result;
}


$(document).ready(function(){
  $(".datepicker").datepicker({
    dateFormat: "dd-mm-yy"
  });
  $(".timepicker").timepicker({"timeformat": "h:i: A"});

  var attr = $('.mobile_phone').prop('required');
  // var val = $('#mobile_notify').val();
  if ($('#mobile_notify').is(':checked')) {
    if (typeof attr === 'undefined' || attr === false){
      $('.mobile_phone').prop('required', 'required');
    }
  }

  var attr = $('.email').prop('required');
  // var val = $('#mobile_notify').val();
  if ($('#email_notify').is(':checked')) {
    if (typeof attr === 'undefined' || attr === false){
      $('.email').prop('required', 'required');
    }
  }

  $("#medication_form").click(function() {
    return validate_start_end_dates();
  });

  $("#email_notify").click(make_email_required);
  $("#mobile_notify").click(make_phone_required);
});


