class PagesController < ApplicationController

  layout 'posts_layout'

  def index
    @posts = Post.exclude_category(["Home Carousel", "Projects"])
    @carousel_posts = Post.include_category(["Home Carousel"])
    render :layout => 'application'
  end
  
  def blog
    @posts = Post.paginate(:page=>params[:page],:per_page=>5)
    @categories = Category.all
    
  end

  def archive
  	@posts = Post.all
  	@post_months = @posts.group_by {|post| post.created_at.beginning_of_month}
    render :layout => "application"

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
    @posts = Post.include_category(["Thesis"])
    @categories = Category.all
    render :blog, :layout => 'posts_layout'
   
  end

   def projects
    @posts = Post.include_category(["Projects"])
    @posts.paginate(:page=>params[:page],:per_page=>1)
    @categories = Category.all
    render :blog, :layout => 'posts_layout'
   
  end
  
  
end