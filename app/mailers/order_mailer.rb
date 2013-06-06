class OrderMailer < ActionMailer::Base
  default :from => "info@krasivopodano.ru"
  
  def confirm_email(order)
    @order = order
    mail(:to => "m.nikolaev@me.com", :bcc => "babrovka@gmail.com", :subject => "krasivopodano.ru | " + t("new_order"))
  end
  
  def appointment_confirm_email(user, event, appointment)
    @user = user
    @event = event
    @appointment = appointment
    mail(:to => @user.email, :bcc => ["babrovka@gmail.com"], :subject => "krasivopodano.ru | " + t("appointment_confirmed"))
  end
end
