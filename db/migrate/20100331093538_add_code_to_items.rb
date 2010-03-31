class AddCodeToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :code, :string, :null => false, :default => ""
  end

  def self.down
    remove_column :items, :code
  end
end
