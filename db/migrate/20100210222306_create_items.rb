class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      
      t.belongs_to :category
      t.belongs_to :brand
      
      t.string :title, :null => false, :default => ""
      t.text :body 
      
      t.float :price, :null => false, :default => 0.0
      t.float :price_old
      
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size    
      
      
      t.integer :gender, :null => false, :default => 1
      t.boolean :public, :null => false, :default => true  

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
