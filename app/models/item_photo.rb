class ItemPhoto < ActiveRecord::Base

  acts_as_list  
  has_attached_file :image, :styles => { :thumb => "90x90#" }    
  
  belongs_to :item
  

  
end
