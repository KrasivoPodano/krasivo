class OrdersController < ApplicationController
  before_filter :new_order

  def create
    unless params[:order][:email2].present?
      @order = Order.create(params[:order])
      @order.save
      send_confirmation
    end
  end

  private

  def new_order
    @order = Order.new(params[:order])
  end
  
  def send_confirmation
    OrderMailer.confirm_email(@order).deliver
  end
end
