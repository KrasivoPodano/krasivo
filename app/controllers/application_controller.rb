class ApplicationController < ActionController::Base
  protect_from_forgery
  
  after_filter :store_location

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/ || request.fullpath =~ /\/admin/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
