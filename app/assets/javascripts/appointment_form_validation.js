$(document).ready(function(){

    $("#new_appointment").validate({

       rules:{
	
			"appointment[firstname]":{
                required: true,
				minlength: 2,
            },

			"appointment[lastname]":{
                required: true,
				minlength: 2,
            },

			"appointment[phone]":{
                required: true,
                digits: true,
				minlength: 7,
                maxlength: 16,
            },

       },

       messages:{


			"appointment[phone]":{
                required: "Это поле обязательно для заполнения",
                digits: "Укажите телефон числом",
				minlength: "Телефон должен быть минимум 7 цифр",
                maxlength: "Максимальное число цифр - 16",
            },

			"appointment[firstname]":{
                required: "Пожалуйста, укажите Ваше имя",
				minlength: "Имя не может быть короче двух букв",
            },

			"appointment[lastname]":{
                required: "Пожалуйста, укажите Вашу фамилию",
				minlength: "Фамилия не может быть короче двух букв",
            },

       }

    });
});