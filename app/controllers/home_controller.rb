class HomeController < ApplicationController
  def index
    
    @posts = Post.except(:where "category_id => 3")
    
    

  end
end