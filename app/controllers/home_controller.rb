class HomeController < ApplicationController
  def index
    
    @posts = Post.all
    @carousel_posts = Post.where(:category_id =>4)
    

  end
end