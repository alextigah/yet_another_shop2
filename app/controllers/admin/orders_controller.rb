class Admin::OrdersController < Admin::AdminController
  
  def index
    @orders = Order.not_state("pending")
  end
  
  def cancel
    @order = Order.find params[:id]
    @order.cancel! unless @order.canceled?
    redirect_to :back
  end
  
end
