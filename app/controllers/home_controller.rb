class HomeController < ApplicationController
  def index
    
    @posts = Post.all.where(:category_id)
    @carousel_posts = Post.where(:category_id =>3)
    

  end
end