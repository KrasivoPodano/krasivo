$(document).ready(function(){
	
		$('#new_appointment').on('ajax:success', function(data, response, xhr) {
	    if (response.status == 'ok') {
	      scroll(0,0)
	      $('.appointment_popup').hide();
	      $('#thank_you').show().fadeOut(4000);
	    }
	    else{
	      $('#appointment_notice').html('заполните поля');
				console.log(response.errors);
				$('#appointment_captcha_wrapper').load("/appointments/refresh_captcha_div");
	    }
	  });
	

});



