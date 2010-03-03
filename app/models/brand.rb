class Brand < ActiveRecord::Base
  
  has_attached_file :image
  
  has_many :items
  
  validates_presence_of :title
  
end
