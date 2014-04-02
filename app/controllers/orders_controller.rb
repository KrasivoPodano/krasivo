class OrdersController < ApplicationController
  before_filter :new_order

  def create
    if @order.save_with_captcha
      result = {status: 'ok'}
    else
      result = {errors: @order.errors}
    end
    render json: result
    # unless params[:order][:email2].present?
    #   @order = Order.create(params[:order])
    #   @order.save
    #   send_confirmation
    # end
  end
  
  def refresh_captcha_div
    render :partial => 'orders/captcha_wrapper'
  end

  private

  def new_order
    @order = Order.new(params[:order])
  end
  
  def send_confirmation
    OrderMailer.confirm_email(@order).deliver
  end
end
