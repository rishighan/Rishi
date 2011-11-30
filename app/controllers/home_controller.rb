class HomeController < ApplicationController
  def index
    @posts = Post.all
    @catname = Post.includes(:categories => :category_name)
  end

end
