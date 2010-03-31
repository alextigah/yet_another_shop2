class ItemPhoto < ActiveRecord::Base

  acts_as_list  
  has_attached_file :image, :styles => { :thumb => "159x190", :small => "90x90", :large => "350x500" }  
  
  belongs_to :item
  

  
end
