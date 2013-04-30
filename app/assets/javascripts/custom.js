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
