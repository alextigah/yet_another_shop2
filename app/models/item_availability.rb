class ItemAvailability < ActiveRecord::Base
  
  belongs_to :item
  
  validates_presence_of :quantity
  validates_uniqueness_of :size, :scope => :item_id
  
  
  named_scope :in_stock, :conditions => "quantity > 0"
  
  default_scope :order => "size ASC"
  
end
