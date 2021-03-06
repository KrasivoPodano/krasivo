function showRecaptcha(element) {
           Recaptcha.create("6Ldb2-QSAAAAAHX6CKLAtkjVA2ubl7X5fA4z1RjX", element, {
             theme: "white",
             callback: Recaptcha.focus_response_field});
         }


$(function() {
	$(".hider-slider").on("click", function() {
		$(this).hide();
		if ($(this).hasClass("show")) {
			$(this).removeClass("show");
			$(".fotorama-container").animate({
				"height" : "806px"
			}, "slow", function() {
				$(".hider-slider").addClass("hide");
				if ($(".fotorama-container").hasClass("map")) {
					$(".hider-slider span").html("cвернуть карту");
				} else {
					$(".hider-slider span").html("cвернуть медиа")
				}

				$(".hider-slider").show();

			});
		} else if ($(this).hasClass("hide")) {
			$(this).removeClass("hide");
			$(".fotorama-container").animate({
				"height" : "310px"
			}, "slow", function() {
				$(".hider-slider").addClass("show");
				if ($(".fotorama-container").hasClass("map")) {
					$(".hider-slider span").html("развернуть карту");
				} else {
					$(".hider-slider span").html("развернуть медиа")
				}
				$(".hider-slider").show();
			});
		}
	})
	if ($(".form").length) {
		var params = {
			changedEl : ".form select",
			visRows : 5,
			scrollArrows : true
		}
		cuSel(params);
		 $("#order_type_select").on("change", function(){

		target = $('#order_type_select').attr('value');

		if(target == "День рождения") {
		    $('#meropriyatie').hide();
			$('#birthsday').show();
			$('#children').hide();
			$('#corporate').hide();
			}
			
		else if(target == "Детский праздник") {
		    $('#meropriyatie').hide();
			$('#birthsday').hide();
			$('#children').show();
			$('#corporate').hide();
			}
			
		else if(target == "Корпоратив") {
			$('#meropriyatie').hide();
			$('#birthsday').hide();
			$('#children').hide();
			$('#corporate').show(); 
			}

		else {
			    $('#meropriyatie').show();
				$('#birthsday').hide();
				$('#children').hide();
				$('#corporate').hide();
			}
		});
	}

	jQuery(".myCheck").mousedown(function() {

		changeCheck(jQuery(this));
		

	});

	jQuery(".myCheck").each(function() {

		changeCheckStart(jQuery(this));

	});

	function changeCheck(el) {
		var el = el, input = el.find("input").eq(0);
		if (!input.attr("checked")) {
			el.css("background-position", "0 -16px");
			input.attr('checked', 'checked');
			input.val('1');
		} else {
			el.css("background-position", "0 0");
			input.attr('checked', null);
			input.val('0');
		}
		return true;
	}

	function changeCheckStart(el) {
		var el = el, input = el.find("input").eq(0);
		if (input.attr("checked")) {
			el.css("background-position", "0 -16px");
		}
		return true;
	}


	
	$(".button-back, .order_popup_link").click(function(e) {
		window.scrollTo(0, 0);
		e.preventDefault();
		$(".order_popup").show();
		// showRecaptcha('order_form_reCAPTCHA');
		$('#order_date').datepicker();	
	})
	
	
	
	$(".auth_popup_link").click(function(e) {
		e.preventDefault();
		$(".auth_popup").show();
	})
	
	$(".auth_popup_link").click(function(e) {
		e.preventDefault();
		$(".auth_popup").show();
	})
	
	
	$(".blue").click(function() {
		$(".blue").hide();
		$(".form").hide();
		$("#ui-datepicker-div").hide();
	})
	$(".close").click(function(e) {
		e.preventDefault();
		$(".blue").hide();
		$(".form").hide();
		$("#ui-datepicker-div").hide();
		
		
	})
	
	
	$(".social a").mouseover(function() {
		$(this).find("img").attr("src", "/assets/" + $(this).attr("rel") + "-hover.png");
	})
	$(".social a").mouseout(function() {
		$(this).find("img").attr("src", "/assets/" + $(this).attr("rel") + ".png");
	})

	$(".budget").on("change", function() {

		var str = $(this).val();
		str = accounting.formatMoney(str, {
			symbol : "Р",
			precision : 0,
			thousand : " ",
			format : {
				pos : "%v %s",
				neg : "%v (%s)",
				zero : "0 %s"
			}
		})
		$(this).val(str);
	})
	$("input:text").on("click", function(){
		if ($(this).val() == $(this).data("first")){
			$(this).val("");
		}
	})
	
	


jQuery(".niceRadio").each(
function() {
     
     changeRadioStart(jQuery(this));
     
});

function changeRadio(el)

{

	var el = el,
		input = el.find("input").eq(0);
	var nm=input.attr("name");
		
	jQuery(".niceRadio input").each(
	
	function() {
     
		if(jQuery(this).attr("name")==nm)
		{
			jQuery(this).parent().removeClass("radioChecked");
		}
	   
	   
	});					  
	
	
	if(el.attr("class").indexOf("niceRadioDisabled")==-1)
	{	
		el.addClass("radioChecked");
		input.attr("checked", true);
	}
	
    return true;
}

function changeVisualRadio(input)
{

	var wrapInput = input.parent();
	var nm=input.attr("name");
		
	jQuery(".niceRadio input").each(
	
	function() {
     
		if(jQuery(this).attr("name")==nm)
		{
			jQuery(this).parent().removeClass("radioChecked");
		}
	   
	   
	});

	if(input.attr("checked")) 
	{
		wrapInput.addClass("radioChecked");
	}
}

function changeRadioStart(el)

{

try
{
var el = el,
	radioName = el.attr("name"),
	radioId = el.attr("id"),
	radioChecked = el.attr("checked"),
	radioDisabled = el.attr("disabled"),
	radioTab = el.attr("tabindex"),
	radioValue = el.attr("value");
	if(radioChecked)
		el.after("<span class='niceRadio radioChecked'>"+
			"<input type='radio'"+
			"name='"+radioName+"'"+
			"id='"+radioId+"'"+
			"checked='"+radioChecked+"'"+
			"tabindex='"+radioTab+"'"+
			"value='"+radioValue+"' /></span>");
	else
		el.after("<span class='niceRadio'>"+
			"<input type='radio'"+
			"name='"+radioName+"'"+
			"id='"+radioId+"'"+
			"tabindex='"+radioTab+"'"+
			"value='"+radioValue+"' /></span>");
	
	
	if(radioDisabled)
	{
		el.next().addClass("niceRadioDisabled");
		el.next().find("input").eq(0).attr("disabled","disabled");
	}
	
	
	el.next().bind("mousedown", function(e) { changeRadio(jQuery(this)) });
	if(jQuery.browser.msie)	el.next().find("input").eq(0).bind("click", function(e) { changeVisualRadio(jQuery(this)) });	
	else el.next().find("input").eq(0).bind("change", function(e) { changeVisualRadio(jQuery(this)) });
	el.remove();
}
catch(e)
{

}

    return true;
}



document.documentElement.onkeydown=function(e) {
    if (!e) {e=window.event}
    if (e.keyCode=="27") {
		$(".blue").hide();
		$(".form").hide();
		$("#ui-datepicker-div").hide();
}
}

});


