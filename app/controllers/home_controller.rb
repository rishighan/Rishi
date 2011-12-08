class HomeController < ApplicationController
  def index
    
    @posts = Post.order("id").page(params[:page]).per(3)
    @carousel_posts = Post.where(:category_id =>4)
    

  end
end