class Post < ActiveRecord::Base

  include Tire::Model::Search
  include Tire::Model::Callbacks

  attr_accessor :title, :content, :published_at
  
  has_and_belongs_to_many :categories
  has_many :attachments, :dependent => :destroy
  has_many :citations, :dependent => :destroy
  
  validates :title, :category_id, :content, :presence =>true
  
  acts_as_taggable_on :keywords
  
  accepts_nested_attributes_for :categories, :allow_destroy => true
  accepts_nested_attributes_for :attachments, :allow_destroy => true, 
                                :reject_if => proc { |attributes| attributes['photo'].blank? }
  accepts_nested_attributes_for :citations, :allow_destroy=>true
  


  def self.search(params)
  tire.search(:load =>true) do
    query { string params[:query]} if params[:query].present?
  end
 end

end
