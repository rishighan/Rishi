module ApplicationHelper
  
  
  def markdown(text)  
    options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]  
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe  
  end 
  
  # updated this to use pygments.rb instead of albino
  # line numbers by passing an options hash
  # http://pygments.org/docs/formatters/#formatter-classes
  # for line numbers add :options => {:linenos => 'inline'} to the Pygments call
  def syntax_highlighter(html)  
    doc = Nokogiri::HTML(html)  
    doc.search("//pre[@lang]").each do |pre|  
       pre.replace Pygments.highlight(pre.text.rstrip, :lexer => pre[:lang], :nowrap => true)  
    end  
    doc.at_css("body").inner_html.to_s  
  end  
  
  #this is a helper method to hide the cart when its empty.
  def hidden_div_if(condition, attributes= {}, &block)
    if condition
      attributes["style"] = "display:none"
    end
    content_tag("div", attributes, &block)
  end

  #page title helper method
  def title(page_title)
    content_for :title do
      page_title
    end
  end
 
end

