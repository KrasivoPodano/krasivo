class OrdersController < ApplicationController
  def create
    @order = Order.new(params[:order])
     if @order.save
        redirect_to :back, :notice => t('order_created')
      else
        render :new
      end
  end
end
