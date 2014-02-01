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
  
  $('#new_order').on( "submit", function() {
    // if (response.status == 'ok') {
      scroll(0,0)
      $('.order_popup').hide();
      $('.blue').hide();
      $('#thank_you').show().fadeOut(4000);
	  //     }
	  // //     else{
	  // // // Recaptcha.reload();
	  // // //       $('#order_notice').html(response.errors.join('<br>'));
	  // // //     }
  });

});