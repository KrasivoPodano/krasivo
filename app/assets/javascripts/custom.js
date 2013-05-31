$(function() {
		var i = 0;
		
        $(".addphone").on('click', function() {
			if(i<2) {
            $(".more-phones").append("<div class='form-line'><label>Ещё один телефон</label> <input type='text' name='tel" + i +"'  data-first='+7 981 000-6969' value='+7 981 000-6969' /><a href='#' class='removephone'>&mdash; удалить номер</a></div>");
			i++;
		}
			return false;
        });

        $(document).on("click", ".removephone", function() { 
                $(this).parent().remove();
				i--;
				
				return false;
        });
});



$(document).ready(function(){


	$('#show_sign_in_frame').on("click", function() {
		$('#show_sign_up_frame').removeClass('active');
		$(this).addClass('active');
		$('#sign_in_frame').show();
		$('#sign_up_frame').hide();
		
		return false
	});
	
	$('#show_sign_up_frame').on("click", function() {
		$('#show_sign_in_frame').removeClass('active');
		$(this).addClass('active');
		$('#sign_in_frame').hide();
		$('#sign_up_frame').show();
		
		return false
	});
	
	$('#register_link').on("click", function() {
		$('.auth_popup').show();
		$('#show_sign_in_frame').removeClass('active');
		$('#show_sign_up_frame').addClass('active');
		$('#sign_in_frame').hide();
		$('#sign_up_frame').show();
		
		return false
	});
	
	
	

/*
$('#sign_in_user').bind('ajax:success', function(data, response, xhr){
  $('#sign_in_user').hide();
});
*/

});


