class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private # this makes the cart method available to controllers and prevents it from being used as an action on the Controller          
  
  def current_cart
    Cart.find(params[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart #this returns the newly created cart
  end
end
