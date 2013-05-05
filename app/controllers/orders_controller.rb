class OrdersController < ApplicationController
  def create
    @order = Order.new(params[:order])
     if @order.save
        redirect_to :back
        flash[:notice] = t('message_created')
      else
        render :new
      end
  end
end
