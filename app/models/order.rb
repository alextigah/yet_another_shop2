class Order < ActiveRecord::Base
  
  CITIES = %w[Киев Винница Днепропетровск Донецк Житомир Запорожье Ивано-Франковск Кировоград Луганск Луцк Львов Николаев Одесса Полтава Ровно Сумы Тернополь Ужгород Харьков Херсон Хмельницкий Черкассы Чернигов Черновцы]
  SHIPPING = %w[Самовывоз Киев Курьером]
  PAYMENT = %w[Наличными WebMoney PrivatMoney LiqPay]
  STATES = {
    :pending => "не оформлен",
    :approved => "новый",
    :confirmed => "подтвержден",
    :paid => "оплачен",
    :delivered => "доставлен",
    :canceled => "отменен"
  }
  
  #Новый - заказ добавлен пользователем, Подтвержден - когда я пообщался с человеком, и он ждет доставки или я например жду от него денег, 
  #Оплачен - когда человек оплатил заказ, Оплачен и Доставлен - когда все действия выполнены, Отменен
  
  has_many :items, :class_name => "OrderItem"
  
  validates_presence_of :user_name, :on => :update
  validates_presence_of :email, :on => :update
  validates_presence_of :phone, :on => :update
  validates_presence_of :city, :on => :update
  validates_presence_of :address, :on => :update
  
  validates_format_of :email, :with => Authlogic::Regex.email, :on => :update
  
  
  def total_amount
    sum = items.collect {|i| i.item.price}.sum.to_i
    sum += 15 if !city.blank? && city != CITIES.first
    sum
  end
  
  def shipping_amount
    15 if !city.blank? && city != CITIES.first
  end
  
  named_scope :approved, :conditions => {:state => "approved"}
  named_scope :paid, :conditions => {:state => "paid"}
  named_scope :not_state, lambda {|state| {:conditions => ["state != ?", state]}}
  
  default_scope :order => "created_at DESC"
  
  
  def item_availability_canceled
    items.each {|i| i.item_availability.increment!(:quantity)}
  end
  
  def item_availability_approved
    items.each {|i| i.item_availability.decrement!(:quantity)}
    Notifier.deliver_order(self)  
    Notifier.deliver_admin_order(self)
  end
  
  include AASM
  
  aasm_column :state  
  aasm_initial_state :pending
  
  aasm_state :pending
  aasm_state :approved, :enter => :item_availability_approved
  aasm_state :delivered
  aasm_state :confirmed
  aasm_state :canceled, :enter => :item_availability_canceled
  aasm_state :paid
  
  aasm_event :approve do 
    transitions :to => :approved, :from => [:pending]
  end
  
  aasm_event :pay do
    transitions :to => :paid, :from => [:pending, :approved, :confirmed]
  end
  
  aasm_event :cancel do
    transitions :to => :canceled, :from => [:approved, :confirmed, :canceled, :paid]
  end 
    
end

