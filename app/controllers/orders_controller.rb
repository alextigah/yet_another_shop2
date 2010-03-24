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
          redirect_to payments_liqpay_path + "?order_id=" + @order.id.to_s + "&user_name=" + @order.user_name  + "&amount=" + @order.total_amount.to_s
        end
    else
      render :show
    end
  end    
  
  
  def success
    @body = "Вы успешно оформили заказ. В ближайшее время с вами свяжется менеджер!"
    render :action => "result"
  end
  
  def payment_success
    @body = "Вы успешно оплатили заказ. В ближайшее время с вами свяжется менеджер!"    
    render :action => "result"
  end
  
  def waiting_for_payment
    @body = "Вы оплатили заказ. После прохождения заказа банковской провери с вами свяжется менеджер!"    
    render :action => "result"
  end
  
  def payment_error
    @body = "К сожалению при оплате заказа возникли какие-то проблемы, попробуйте позже или используйте другой спопоб оплаты."
    render :action => "result"    
  end
    
end
