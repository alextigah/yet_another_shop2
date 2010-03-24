class OrdersController < ApplicationController
  
  def update
    @order.update_attributes(params[:order])
    if @order.save
      @order.approve!
      
      
      new_order = Order.create
      session[:order_id] = new_order.id
      case params[:order][:payment_type].to_i
        when 0
          redirect_to success_orders_path
        when 1
          render :text => "webmoney not supported yet"
        when 2
          redirect_to privatmoney_orders_path
        when 3
          redirect_to payments_liqpay_path + "?order_id=" + @order.id.to_s + "&user_name=" + @order.user_name  + "&amount=5"
        end
    else
      render :show
    end
  end    
    
end
