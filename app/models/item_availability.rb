class ItemAvailability < ActiveRecord::Base
  
  belongs_to :item
  
  validates_presence_of :quantity
  validates_uniqueness_of :size, :scope => :item_id
  
end
