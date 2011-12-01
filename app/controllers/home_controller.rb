class HomeController < ApplicationController
  def index
    @posts = Post.all
    cat_id = params[:category_id]
    @cat = Category.select(:category_name).where("category_id = :cat_id")
  end

end
