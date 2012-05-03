class SitemapController < ApplicationController
  def index
    @urls = ['http://rishighan.com', 'http://rishighan.com/projects', 'http://rishighan.com/blog','http://rishighan.com/thesis']
    @blog = Post.exclude_category(["Home Carousel","Projects"]).without_draft.all
    @projects = Post.include_category(['Projects']).without_draft.all
    @thesis = Post.include_category(['Thesis']).without_draft.all
    headers['content-type'] ='application/xml'
    render :layout=>false
  end

end
