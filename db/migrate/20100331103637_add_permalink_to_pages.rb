class AddPermalinkToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :permalink, :string, :null => false, :default => ""
  end

  def self.down
    remove_column :pages, :permalink
  end
end
