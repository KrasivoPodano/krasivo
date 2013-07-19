class OrdersController < ApplicationController
  def create
    @order = Order.new(params[:order])      
      
      respond_to do |format|
        if @order.save
          format.html { redirect_to :back, :notice => t('order_created') }
          OrderMailer.confirm_email(@order).deliver
        else
          format.html
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end     
  end
  
  
  
  
end
