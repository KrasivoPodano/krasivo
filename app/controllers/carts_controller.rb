class CartsController < InheritedResources::Base
  
  def show
    @cart = current_cart
  end
  
end
