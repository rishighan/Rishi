class Order < ActiveRecord::Base
  
  validates :firstname, :lastname, :address1, :address2, :city, :state, :zipcode, :phone, :email, :pay_type, 
            :presence => true
  
  #more validations
  #phone numbers
  # regex [\(?0-9 \)?]{3,6}?-?[0-9]{3} ?-?[0-9]{4}
  # for matching: 
  # 2154701106 or 215 470 1106 or (215) 470-1106 or 215-470-1106
  validates_format_of :phone, :with => /^[\(?0-9 \)?]{3,6}?-?[0-9]{3} ?-?[0-9]{4}$/,
                      :notice => 'Phone numbers can have the following format'
 
  before_save :clean_phone_number
  
  #zipcodes
  
 
 def clean_phone_number
    self.phone= self.phone.gsub(/\D/, '')
 end 
  


end
  