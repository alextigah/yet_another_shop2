class Sale < ActiveRecord::Base
  
  has_attached_file :image
  
  validates_presence_of :title
  
  named_scope :limit, lambda {|limit| { :limit => limit}}
  named_scope :published, :conditions => {:public => true}
  named_scope :random, :order => "rand()"  
  
  
end
