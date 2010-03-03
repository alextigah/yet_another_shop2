class Category < ActiveRecord::Base
  
  acts_as_list
  
  has_many :items
  
  validates_presence_of :title
  
end
