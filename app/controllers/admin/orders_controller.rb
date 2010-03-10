class Admin::OrdersController < Admin::AdminController
  
  def index
    @orders = Order.approved
  end
  
end
