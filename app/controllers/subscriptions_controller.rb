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
  
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to root_path, :notice => 'subscription_successfully_destroyed' }
    end
  end
  
end
