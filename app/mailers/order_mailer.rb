# coding: utf-8

class OrderMailer < ActionMailer::Base
  default :from => "info@krasivopodano.ru"
  
  def confirm_email(order)
    @order = order
    mail(:to => "info@krasivopodano.ru", 
         :cc => "m.nikolaev@me.com", 
         :bcc => "babrovka@gmail.com", 
         :subject => "ВАЖНО: krasivopodano.ru | " + t("new_order"),
         'Importance' => 'high',
         'X-Priority' => '1')
  end
  
  def appointment_email(firstname, lastname, phone, event)
    @firstname = firstname
    @lastname = lastname
    @phone = phone
    @event = event
    mail(:to => "info@krasivopodano.ru", 
         :bcc => ["m.nikolaev@me.com", "babrovka@gmail.com"], 
         :subject => "ВАЖНО: krasivopodano.ru | " + t("appointment_created"),
          'Importance' => 'high',
          'X-Priority' => '1')
  end
  
  def appointment_confirm_email(user, event, appointment)
    @user = user
    @event = event
    @appointment = appointment
    mail(:to => @user.email, 
         :bcc => ["m.nikolaev@me.com", "babrovka@gmail.com"], 
         :subject => "ВАЖНО: krasivopodano.ru | " + t("appointment_confirmed"),
          'Importance' => 'high',
          'X-Priority' => '1')
  end
end
