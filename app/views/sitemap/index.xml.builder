xml.instruct! 
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  @urls.each do |url|
    xml.url do
      xml.loc url
      xml.priority 0.9  
    end
  end

  @blog.each do |post|
    xml.url do
      xml.loc blog_post_url(post)
      xml.lastmod post.updated_at.to_date
      xml.priority 0.9
    end
  end
  
  @projects.each do |project|
     xml.url do
       xml.loc project_url(project)
       xml.lastmod project.updated_at.to_date
       xml.priority 0.9
     end
   end
   
   @thesis.each do |thesis_article|
      xml.url do
        xml.loc thesis_article_url(thesis_article)
        xml.lastmod thesis_article.updated_at.to_date
        xml.priority 0.9
      end
    end

end