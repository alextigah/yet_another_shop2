class RemovePermalinkFromItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :permalink
    
  end

  def self.down
    add_column :items,  :permalink, :string,                           :null => false    
  end
end
