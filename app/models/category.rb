class Category < ActiveRecord::Base
  
  acts_as_list
  
  has_many :items
  
  validates_presence_of :title
  validates_presence_of :permalink
  validates_uniqueness_of :permalink
  
  named_scope :published, :conditions => {:public => true}  
  
  
  def link
    "/shop/#{permalink}"
  end
  
end
