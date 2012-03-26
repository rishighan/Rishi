class Variant < ActiveRecord::Base

  belongs_to :product
 
  has_many :attributions, :dependent => :destroy
  has_many :traits, :through=> :attributions

  validates :price, :numericality =>{:greater_than_or_equal_to => 0.01}

  accepts_nested_attributes_for :attributions, :allow_destroy =>true

  #line_items
  has_many :line_items, :dependent => :destroy
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  # file uploads
  has_many :digitalfiles, :dependent =>:destroy
  accepts_nested_attributes_for :digitalfiles

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
    return true
    else
      errors.add(:base, "Line items present")
    end

  end

end
