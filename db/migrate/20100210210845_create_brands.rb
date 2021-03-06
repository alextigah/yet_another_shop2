class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      
      t.string :title, :null => false
      
      t.text :body
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      
      
      t.boolean :public, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :brands
  end
end

# add_column :users, :avatar_file_name,    :string
# add_column :users, :avatar_content_type, :string
# add_column :users, :avatar_file_size,    :integer