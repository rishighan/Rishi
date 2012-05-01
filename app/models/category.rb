class Category < ActiveRecord::Base
  
  has_and_belongs_to_many :posts
  validates :category_name, :category_description, :presence => true
  
  def self.filter_category(params)
    where("category_name NOT IN (?)", params)
  end
  
end
