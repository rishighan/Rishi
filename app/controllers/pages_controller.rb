class PagesController < ApplicationController

  layout 'posts_layout'

  def index
    @posts = Post.includes(:categories).where('categories.category_name!= "Home Carousel"')
    @carousel_posts = Post.includes(:categories).where('categories.category_name = "Home Carousel"')
    render :layout => 'application'
  end
  
  def blog
    @posts = Post.paginate(:page=>params[:page],:per_page=>5)
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
    @categories = Category.all
 
    if request.path!= blog_post_path(@post)
      redirect_to blog_post_path(@post), :status =>:moved_permanently
    end
  end
  
  def thesis
    @post = Post.includes(:categories).where('categories.category_name = "Thesis"')
    @categories = Category.all
   
  end
  
  
end