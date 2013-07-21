$(document).ready(function(){
  
  $('#new_order').on('ajax:success', function(data, response, xhr) {
    if (response.status == 'ok') {
      scroll(0,0)
      $('.order_popup').hide();
      $('#thank_you').show().fadeOut(4000);
    }
    else{
      $('#order_notice').html(response.errors.join('<br>'));
    }
  });

});