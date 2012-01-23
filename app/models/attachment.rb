class Attachment < ActiveRecord::Base
  
  belongs_to :post
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :url => "/pictures/:style/:basename.:extension",
                    :path =>":rails_root/public/pictures/:style/:basename.:extension"
                    
  
end
