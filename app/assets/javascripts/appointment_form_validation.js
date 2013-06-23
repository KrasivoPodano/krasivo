$(document).ready(function(){

    $("#new_appointment").validate({

       rules:{

            "appointment[people]":{
                required: true,
                digits: true,
				number: true,
            },

			"appointment[phone]":{
                required: true,
                digits: true,
				minlength: 7,
                maxlength: 16,
            },

       },

       messages:{

            "appointment[people]":{
                required: "Это поле обязательно для заполнения",
                digits: "Укажите количество гостей числом",
				number: "Укажите количество гостей числом",
            },

			"appointment[phone]":{
                required: "Это поле обязательно для заполнения",
                digits: "Укажите телефон числом",
				minlength: "Телефон должен быть минимум 7 цифр",
                maxlength: "Максимальное число цифр - 16",
            },

       }

    });
});