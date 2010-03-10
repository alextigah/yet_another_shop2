class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      
      t.integer :shipping_type, :null => false, :default => 0
      t.integer :payment_type, :null => false, :default => 0
      
      t.string :state, :null => false, :default => "pending"
      
      t.string :code, :null => false, :default => ""
      
      t.string :user_name, :null => false, :default => ""
      t.string :email, :null => false, :default => ""
      t.string :phone, :null => false, :default => ""
      t.string :city, :null => false, :default => ""
      t.text   :address, :null => false, :default => ""
      t.text   :comments, :null => false, :default => ""

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
