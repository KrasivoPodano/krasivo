$(document).ready(function(){

    $("#new_appointment").validate({

       rules:{

            "appointment[comment]":{
                required: true,
                minlength: 4,
                maxlength: 16,
            },

            "appointment[people]":{
                required: true,
                digits: true,
				number: true,
            },

       },

       messages:{

            "appointment[comment]":{
                required: "Пожалуйста, укажите заголовок",
                minlength: "Заголовок должен быть минимум 4 символа",
                maxlength: "Максимальное число символо - 16",
            },

            "appointment[people]":{
                required: "Это поле обязательно для заполнения",
                digits: "Укажите количество гостей числом",
				number: "Укажите количество гостей числом",
            },

       }

    });
});