class OrdersController < ApplicationController
  before_filter :new_order

  def create
    if verify_recaptcha(model: @order) && @order.save
      send_confirmation
      result = {status: 'ok'}
    else
      result = {errors: @order.errors.full_messages}
    end
    render json: result
  end

  private

  def new_order
    @order = Order.new(params[:order])
  end
  
  def send_confirmation
    OrderMailer.confirm_email(@order).deliver
  end
end
