class AddSizeTableUrlToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :size_table, :string, :null => false, :default => ""
  end

  def self.down
    remove_column :items, :size_table
  end
end
