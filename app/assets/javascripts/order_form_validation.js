// $(document).ready(function(){
// 
//     $("#new_order").validate({
// 
//        rules:{
// 	
// 			"order[comment]":{
//                 required: true,
// 				minlength: 2,
//             },
// 
//        },
// 
//        messages:{
// 
// 
// 			"order[comment]":{
//                 required: "Это поле обязательно для заполнения",
// 				minlength: "Телефон должен быть минимум 2 символа",
//             },
// 
//        }
// 
//     });
// });


$(document).ready(function(){
	
	$('#new_order').on('ajax:success', function(data, response, xhr) {
    if (response.status == 'ok') {
      scroll(0,0)
      $('.order_popup').hide();
      $('#thank_you').show().fadeOut(4000);
    }
    else{
      $('#order_notice').html('заполните поля');
			console.log(response.errors);
			$('#captcha_wrapper').load("/orders/refresh_captcha_div");
			
			
			
    }
  });



});