class AdminController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @post = Post.all
      respond_to do |format|
      format.html #going to the admin index page?
    end
  end

end
