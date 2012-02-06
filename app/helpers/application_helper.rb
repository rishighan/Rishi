module ApplicationHelper
    def markdown(text)  
    options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]  
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe  
  end 
  
  # updated this to use pygments.rb instead of albino
  def syntax_highlighter(html)  
    doc = Nokogiri::HTML(html)  
    doc.search("//pre[@lang]").each do |pre|  
       pre.replace Pygments.highlight(pre.text.rstrip, :lexer => pre[:lang])  
    end  
    doc.to_s  
  end  
end
