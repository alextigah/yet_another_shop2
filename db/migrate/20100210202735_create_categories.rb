class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :title
      t.string :permalink, :null => false
      
      t.integer :position, :null => false, :default => 0
      
      t.boolean :public, :null => false, :default => true
      
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
