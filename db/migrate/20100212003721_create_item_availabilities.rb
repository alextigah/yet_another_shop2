class CreateItemAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :item_availabilities do |t|

      t.belongs_to :item
      t.integer :size, :null => false, :default => 0
      t.integer :quantity, :null => false, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :item_availabilities
  end
end
