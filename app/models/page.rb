class Page < ActiveRecord::Base
  
  acts_as_list
  
  validates_presence_of :title
  validates_presence_of :body
  
  named_scope :published, :conditions => {:public => true}  
  
  def link
    "/page/#{id}"
  end
  
end
