class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  #rescue_from ActiveRecord::RecordNotFound, :with=> :render_not_found
  #rescue_from ActionView::TemplateError, :with=> :render_not_found
  
  def render_not_found
    #render "#{Rails.root}/public/404"
    render "#{Rails.root}/public/404", :layout => 'error_layout'
  end

  
  private # this makes the cart method available to controllers and prevents it 
          #from being used as an action on the Controller          
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart #this returns the newly created cart
  end
  
 protected

 def layout_by_resource
  if devise_controller?
    "admin_layout"
  else
    "application"
  end
 end

end
