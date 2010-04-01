class ItemPhoto < ActiveRecord::Base

  acts_as_list  
  has_attached_file :image, :styles => { :thumb => "160x200", :small => "90x113", :large => "400x500#" }  
  
  belongs_to :item
  

  
end
