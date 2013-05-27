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
       link_to "я передумал", event, method: :delete, :class => controller_name == "carts" ? 'unlike_link' : 'button-blue active'
     else
       link_to "я пойду!", line_items_path(event_id: event), :class => 'button-blue', :method => :post
     end
   end
   
   def order_link(event)
     if current_cart.events.exists?(event)
       unless current_user.appointments.find_by_event_id(event.id)
       link_to "Записаться", appointments_path(event_id: event), method: :post, :class => controller_name == "carts" ? 'appointment_link' : 'button-blue active'
       end
      end   
   end
end
