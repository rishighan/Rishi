class HomeController < ApplicationController
  def index
    
    @posts = Post.where('category_id != 4').page(params[:page]).per(3)
    @carousel_posts = Post.where(:category_id =>4)

  end
end