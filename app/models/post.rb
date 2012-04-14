class Post < ActiveRecord::Base

  has_and_belongs_to_many :categories
  has_many :attachments, :dependent => :destroy
  has_many :citations, :dependent => :destroy
   
  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  def self.search(params)
    tire.search(:load=>true) do
      query { string params[:query], :default_operator => "AND" } if params[:query].present?
      #filter :range, published_at: {lte: Time.zone.now}
    end
  end
  
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]
  
 
  
  validates :title, :content, :presence =>true
  acts_as_taggable_on :keywords
  
  accepts_nested_attributes_for :categories, :allow_destroy => true

  #reject_if nested attributes are empty, dont write them to database.
  accepts_nested_attributes_for :attachments, :allow_destroy => true, 
                                :reject_if => proc { |attributes| attributes['photo'].blank? }
  accepts_nested_attributes_for :citations, :allow_destroy=>true,
                                :reject_if => proc { |attributes| attributes['source_name'].blank? }

  
  # def should_generate_new_friendly_id?
  #     new_record?    
  #   end

end
