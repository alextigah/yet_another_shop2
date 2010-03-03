class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|

      t.string :title, :null => false, :default => ""
      t.text :body
      
      t.integer :position, :null => false, :default => 0
      t.boolean :public, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
