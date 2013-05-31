# coding: utf-8

module ApplicationHelper
  
  def controller?(*controller)
     controller.include?(params[:controller])
   end

   def action?(*action)
     action.include?(params[:action])
   end
   
   def nav_link(link_text, link_path)
     class_name = current_page?(link_path) ? 'active' : ''
     link_to link_text, link_path, :class => class_name
   end
   
   def current_cart
     Cart.find(session[:cart_id])
   rescue ActiveRecord::RecordNotFound
     cart = Cart.create
     session[:cart_id] = cart.id
     cart
   end
   
   def appointment_link(event)
     if current_cart.events.exists?(event)
       link_to "мне нравится", event, method: :delete, :class => controller_name == "carts" ? 'unlike_link' : 'button-blue active'
     else
       link_to "мне нравится", line_items_path(event_id: event), :class => 'button-blue', :method => :post
     end
   end
   
   def cart_like(event)
       link_to "убрать из избранного", event, method: :delete, :class => controller_name == "carts" ? 'unlike_link' : 'button-blue active'
   end
   
   def order_link(event)
     if user_signed_in? && current_user.events.exists?(event)
       link_to "Я записан", cart_path(current_cart), :class => controller_name == "carts" ? 'appointment_link' : 'button-blue active'
     else
       link_to "Записаться", appointments_path(event_id: event), remote: true, method: :post, :class => controller_name == "carts" ? 'appointment_link' : 'button-blue active'
    end 
   end
   
   def resource_name
       :user
     end

   def resource
     @resource ||= User.new
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end
   
   
end
