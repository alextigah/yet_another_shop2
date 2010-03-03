class Item < ActiveRecord::Base
  
  has_attached_file :image  

  GENDER = %w[Девушки Парни Унисекс]
  SIZE = %w[S M L XL]
  
  acts_as_taggable_on :tags, :colors

  named_scope :female, :conditions => ["gender != 1"]
  named_scope :male, :conditions => ["gender != 0"]
    
  belongs_to :brand
  belongs_to :category
  
  has_many :availabilities, :class_name => "ItemAvailability"
  has_many :item_availabilities
  
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :price
  validates_presence_of :gender  
  validates_associated :brand
  validates_associated :category
  
end
