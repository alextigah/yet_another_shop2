class Brand < ActiveRecord::Base
  
  has_attached_file :image
  
  has_many :items
  
  validates_presence_of :title
  validates_presence_of :permalink
  validates_presence_of :body
  
  named_scope :published, :conditions => {:public => true}
  
  after_save :make_permalink
  
  def make_permalink
    permalink = title.gsub(',','').gsub('\\','-').gsub(" ",'-').gsub("#",'-') if permalink.blank?
  end  
  
end
