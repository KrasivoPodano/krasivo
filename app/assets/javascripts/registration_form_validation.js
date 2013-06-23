$(document).ready(function(){

    $("#new_registration").validate({

       rules:{

            "user[email]":{
                required: true,
                email: true,
            },

            "user[password]":{
                required: true,
                minlength: 8,
                maxlength: 16,
            },

			"user[password_confirmation]":{
                required: true,
				equalTo: "#new_registration #user_password",
            },

       },

       messages:{

            "user[email]":{
                required: "Это поле обязательно для заполнения",
                email: "Введен неверный формат электронной почты",
            },

            "user[password]":{
                required: "Это поле обязательно для заполнения",
                minlength: "Пароль должен быть минимум 8 символов",
                maxlength: "Пароль должен быть максимум 16 символов",
            },

			"user[password_confirmation]":{
                required: "Это поле обязательно для заполнения",
                equalTo: "Подтверждение должно совпадать с паролем",
            },

       }

    });
});