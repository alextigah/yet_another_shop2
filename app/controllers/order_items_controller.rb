class OrderItemsController < ApplicationController

  def create
    @order.items.create(params[:order_item])
    redirect_to :back    
  end
    
  def destroy
    item = @order.items.find_by_id params[:id]
    item.destroy if item
    redirect_to :back
  end  
  
end