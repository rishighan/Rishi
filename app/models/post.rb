class Post < ActiveRecord::Base

  has_and_belongs_to_many :categories
  has_many :attachments, :dependent => :destroy
  has_many :citations, :dependent => :destroy
   
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_draft
  
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]

  validates :title, :content, :presence =>true, :uniqueness => true
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
  
  # filtering by category
  def self.exclude_category(cats)
    without_draft.includes(:categories).where('categories.category_name NOT IN (?)', cats).order('posts.created_at DESC')
  end

  def self.include_category(cats)
    without_draft.includes(:categories).where('categories.category_name IN (?)', cats)
    
  end

  
  # Elasticsearch
  # TODO: update the index upon deletion
  # overriding the default tire search function
  def self.search(params)
    tire.search(:load=>true, :page => params[:page], :per_page=>5) do
      query { string params[:query], :default_operator => "AND" } if params[:query].present?
      #filter :range, published_at: {lte: Time.zone.now}
      sort {by :created_at, "desc"}
      
    end
  end
  
  #overriding the model method
  def to_indexed_json
    to_json(:methods=> [:citation_names,:category_names])
  end
  
  #associations have to be looped over.
  def citation_names
    citations.each do |snames|
      snames.source_name
      snames.extended_description
    end
  end
  
  def category_names
    categories.each do |cat|
      cat.category_name
    end
  end
  
end
