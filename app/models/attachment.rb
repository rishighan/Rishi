class Attachment < ActiveRecord::Base
  
  belongs_to :post
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :path => ":rails_root/public/attachments/:style/:basename.:extension",
                    :url => "attachments/:style/:basename.:extension"
  
end
