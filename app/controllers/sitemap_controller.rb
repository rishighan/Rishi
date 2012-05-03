class SitemapController < ApplicationController
  def index
    @urls =['http://rishighan.com', 'http://rishighan.com/projects', 'http://rishighan.com/blog','http://rishighan.com/thesis']
    headers['content-type'] ='application/xml'
    render :nothing => true
  end

end
