class AdminController < ApplicationController

  before_filter :authenticate_user!
  layout 'admin_layout'
  def index
    @posts = Post.find(:all, :order=>"created_at desc", :limit=>2)
    @orders = Order.find(:all, :order=>"created_at desc", :limit=>3)

    respond_to do |format|
      format.html #going to the admin index page?
    end
  end

end
