class CreateItemPhotos < ActiveRecord::Migration
  def self.up
    create_table :item_photos do |t|
      t.integer :item_id, :null => false
      
      t.string :image_file_name, :null => false, :default => ""
      t.string :image_content_type, :null => false, :default => ""
      t.integer :image_file_size, :null => false, :default => 0
      
      t.integer :position, :null => false, :default => 0      

      t.timestamps
    end
  end

  def self.down
    drop_table :item_photos
  end
end
