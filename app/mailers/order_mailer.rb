class OrderMailer < ActionMailer::Base
  default :from => "info@krasivopodano.ru"
  
  def confirm_email(order)
    @order = order
    mail(:to => "babrovka@gmail.com", :subject => "krasivopodano.ru | " + t("new_order"))
  end
end
