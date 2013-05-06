//= require active_admin/base

$(document).ready(function(){

  $('.destraction').on("click", function(){
	answer = confirm("Are you sure?");
	      if (answer) {
			$(this).attr('checked', 'checked'); 
		    $(this).closest('.has_many_fields').hide();
	         return true;
	      }else{
	         return false;
	      };

	
  });

	
  $('.album__image').on("click", function(){
	answer = confirm("Are you sure?");
	      if (answer) {
			$(this).hide();
	         return true;
	      }else{
	         return false;
	      };

	
  });



  
});

