class Admin::OrdersController < Admin::AdminController
  
  def index
    @orders = Order.not_state("pending")
  end
  
end
