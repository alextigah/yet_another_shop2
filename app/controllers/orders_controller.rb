class OrdersController < ApplicationController

  
  def update
    @order.update_attributes(params[:order])
    if @order.save
      @order.approve!
      @order = Order.create
      session[:order_id] = @order.id
      redirect_to success_orders_path
    else
      render :show
    end
  end    
    
end
