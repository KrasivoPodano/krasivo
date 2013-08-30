class SubscriptionsController < ApplicationController
  
  def subscribe
    @subscription = Subscription.new(params[:subscription])
      
    if @subscription.save
      result = {status: 'ok'}
    else
      result = {errors: @subscription.errors.full_messages}
    end
    render json: result  
  end
  
end
