class AddPermalinksToItemsAndBrands < ActiveRecord::Migration
  def self.up
    add_column :items, :permalink, :string, :null => false
    add_column :brands, :permalink, :string, :null => false
  end

  def self.down
    remove_column :items, :permalink
    remove_column :brands, :permalink
  end
end
