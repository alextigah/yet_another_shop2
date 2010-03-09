class Order < ActiveRecord::Base
  
  has_many :items, :class_name => "OrderItem"
  
  validates_presence_of :user_name, :on => :update
  validates_presence_of :email, :on => :update
  validates_presence_of :phone, :on => :update
  validates_presence_of :city, :on => :update
  validates_presence_of :address, :on => :update
  
  validates_format_of :email, :with => Authlogic::Regex.email, :on => :update
  
  
  named_scope :approved, :conditions => {:state => "approved"}
  
  include AASM
  
  aasm_column :state  
  aasm_initial_state :pending
  
  aasm_state :pending
  aasm_state :approved  
  
  aasm_event :approve do 
    transitions :to => :approved, :from => [:pending]
  end
    
end

