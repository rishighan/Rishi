module ApplicationHelper
  
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
     
    end
    #this will parse HTML markup in the content
    return text.html_safe 
  end
  
end
