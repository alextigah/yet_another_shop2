class AddLinkToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :link, :string, :null => false, :defaul => ""
  end

  def self.down
    remove_column :sales, :link
  end
end
