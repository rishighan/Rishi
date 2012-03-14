class Trait < ActiveRecord::Base

  has_many :attributions, :dependent => :destroy
  has_many :variants, :through => :attributions
  
end
