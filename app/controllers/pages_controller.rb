class PagesController < ApplicationController

  layout 'posts_layout'
  before_filter :setup
  
  # making sure that categories are filtered
  # TODO: see if we can remove the repitition in the posts
  def setup
    @categories = Category.filter_category(["Projects", "Home Carousel", "Colophon"])
  end  
    
  def index
    @display_posts = Post.exclude_category(["Home Carousel", "Projects", "Thesis", "Colophon"]).limit(5)
    @posts = @display_posts.without_draft.all
    @carousel_posts = Post.include_category(["Home Carousel"])
    @thesis_posts = Post.include_category(["Thesis"])

    @product = Product.first #just a test
    render :layout => 'application'
    
  end
  
  # GET /blog
  def blog
    @posts = Post.exclude_category(["Projects", "Home Carousel", "Thesis", "Colophon"]) 
    @posts = @posts.paginate(:page => params[:page], :per_page=>5)
    respond_to do |format|
      format.html
      format.xml {render :xml => @posts} # Do we need a builder, and if yes, why?
    end
  end

  # GET /blog/archive
  def archive
  	@posts = Post.exclude_category(["Home Carousel", "Colophon"]).all
  	@post_months = @posts.group_by {|post| post.created_at.beginning_of_month}
    render :layout => "application"
  end

  # GET 
  def search
    @posts = Post.search(params)
    #@post = @post.paginate(:page => params[:page], :per_page=>5)
    render :action => :blog
  end

  # GET /blog/post/some-blog-post
  def post
    @post =Post.find(params[:id])

    if request.path!= blog_post_path(@post)
      redirect_to blog_post_path(@post), :status =>:moved_permanently
    end
  end

  # GET /blog/category/categoryname
  def bycategory
    @posts = Post.include_category(params[:category_name])
    @posts = @posts.paginate(:page => params[:page], :per_page=>5)
    render :blog 
  end

  
  # GET /thesis
  def thesis
    @posts = Post.include_category(["Thesis"])
    @posts = @posts.paginate(:page=>params[:page],:per_page=>6)
    render :layout => 'posts_layout'
  end
  
  # GET /thesis/some-blog-post
  def thesis_article
    @post = Post.find(params[:id])
    render :post
  end
  
   # GET /projects
   def projects
    @initial_posts = Post.include_category(["Projects"])
    @posts = @initial_posts.paginate(:page=>params[:page],:per_page=>1)
    render :blog
   
  end

  # /project/some-project
  def project
    @post = Post.find(params[:id])
    render :post
  end
  
  # /colophon
  def colophon
    @post = Post.include_category(['Colophon'])
    render :layout => 'application'
  end
  

  
end