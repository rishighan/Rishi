class Product < ActiveRecord::Base
  
  validates :title, :description, :price, :presence=>true
  
  
  belongs_to :productCategory
  
  has_attached_file :productshot, :styles => { :medium => "637x471>", 
                    :thumb => Proc.new { |instance| instance.resize }},
                    :url => "/productShots/:style/:basename.:extension",
                    :path =>":rails_root/public/productShots/:style/:basename.:extension"
                    
                    
  validates_attachment_content_type :productshot, :content_type => ['image/png', 'image/jpg', 'image/jpeg', 'image/gif  ']                  
  validates_attachment_size :productshot, :less_than => 2.megabytes


### End Paperclip ####


 def resize     
     geo = Paperclip::Geometry.from_file(productshot.to_file(:original))

     ratio = geo.width/geo.height  

     min_width  = 142
     min_height = 119

     if ratio > 1
       # Horizontal Image
       final_height = min_height
       final_width  = final_height * ratio
       "#{final_width.round}x#{final_height.round}!"
     else
       # Vertical Image
       final_width  = min_width
       final_height = final_width * ratio
       "#{final_height.round}x#{final_width.round}!"
     end
  end 
  
end