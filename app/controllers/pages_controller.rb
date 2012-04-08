class PagesController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def blog
    @posts = Post.all
    @categories = Category.all
  end

  def archive
  	@posts = Post.all
  	@post_months = @posts.group_by {|post| post.created_at.beginning_of_month}

  end

    # GET /articles/search
  def search
    @post = Post.search params[:q], :load =>true
    render :action => "archive"
  end

  
  def post
    @post =Post.find(params[:id])

  end
  
  
end