class OrdersController < ApplicationController
  def create
    @order = Order.new(params[:order])      
      
      respond_to do |format|
        if verify_recaptcha(:model=>@object,:message=>"Verification code is wrong") && @order.save
          format.html { redirect_to :back, :notice => t('order_created') }
          OrderMailer.confirm_email(@order).deliver
          format.js
        else
          format.js
          format.html
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end     
  end
  
  
  
  
end
