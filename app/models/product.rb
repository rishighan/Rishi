class Product < ActiveRecord::Base
  
  validates :title, :description, :price, :presence=>true
  validates :title, :uniqueness => true
  validates :price, :numericality =>{:greater_than_or_equal_to => 0.01}
  
  
  
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  #categories
  has_and_belongs_to_many :product_categories
  accepts_nested_attributes_for :product_categories
  
  #variants
  has_many :variants, :dependent => :destroy
  
  #attached photos
  has_many :product_shots, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :product_shots, :allow_destroy => true,
                                :reject_if => proc { |attributes| attributes['shot'].blank? } 
  
  
  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, "Line items present")
    end
    
  end
end