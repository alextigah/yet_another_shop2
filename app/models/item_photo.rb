class ItemPhoto < ActiveRecord::Base

  acts_as_list  
  has_attached_file :image, :styles => { :small => "90x113", :large => "400x500#" }  
  
  belongs_to :item
  

  
end
