class PagesController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def blog
    @posts = Post.all
    @categories = Category.all
    
  end
  
  def post
    @post =Post.find(params[:id])

  end
  
  
end