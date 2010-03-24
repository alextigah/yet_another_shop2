class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.string :title, :null => false, :default => ""
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      
      t.boolean :public, :null => false, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
