$(document).ready(function(){
  
  $('#new_subscription').on('ajax:success', function(data, response, xhr) {
    if (response.status == 'ok') {
      scroll(0,0)
      $('.subscription_popup').hide();
      $('.blue').hide();
      $('#subscribed').show().fadeOut(4000);
    }
    else{
      $('#subscription_notice').html(response.errors.join('<br>'));
    }
  });

  $('#new_subscription').submit(function() {
    if ($( "input[name='subscription[articles]']" ).val() != '1' && $( "input[name='subscription[events]']" ).val() != '1') {
      $('#subscription_notice1').html('Ну хотя б на что нибудь подпишитесь!<br>');
	  return false;
    }
  });

});
