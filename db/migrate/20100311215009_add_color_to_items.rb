class AddColorToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :color, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :items, :color
  end
end
