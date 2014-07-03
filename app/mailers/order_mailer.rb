# coding: utf-8

class OrderMailer < ActionMailer::Base
  default :from => "info@krasivopodano.ru"
  
  def confirm_email(order)
    @order = order
    mail(:to => "info@krasivopodano.ru", 
         :cc => "m.nikolaev@me.com", 
         :bcc => "babrovka@gmail.com", 
         :subject => "krasivopodano.ru | " + t("new_order"),
         'Importance' => 'high',
         'X-Priority' => '1')
  end
  
  def appointment_email(firstname, lastname, phone, event, appointment)
    @firstname = firstname
    @lastname = lastname
    @phone = phone
    @event = event
    mail(:to => "info@krasivopodano.ru", 
         :bcc => ["m.nikolaev@me.com", "babrovka@gmail.com"], 
         :subject => "krasivopodano.ru | На сайте создана заявка №#{appointment.id} от #{appointment.created_at.strftime('%d.%m')}",
          'Importance' => 'high',
          'X-Priority' => '1')
  end
  
  def appointment_confirm_email(user, event, appointment)
    @user = user
    @event = event
    @appointment = appointment
    mail(:to => @user.email, 
         :bcc => ["m.nikolaev@me.com", "babrovka@gmail.com"], 
         :subject => "krasivopodano.ru | " + t("appointment_confirmed"),
          'Importance' => 'high',
          'X-Priority' => '1')
  end
end
