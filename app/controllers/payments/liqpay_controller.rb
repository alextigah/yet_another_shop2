class Payments::LiqpayController < ApplicationController
  
  protect_from_forgery :except => [:reply]
  
  
  def show
    create
  end
  
  def create
    server = URI.parse "https://liqpay.com"
    server.query = URI.encode query(params[:amount]).map {|k,v| "#{k}=#{v}"}.join("&")
    redirect_to server.to_s
  end
  
  def reply
    case params[:status] 
    when "wait_secure"
      redirect_to waiting_for_payment_orders_path
    when "success"
      if signature == params[:signature]
        order = Order.find(params[:order_id])
        order.pay! unless order.paid?
        redirect_to payment_success_orders_path
      end
    else
      redirect_to payment_error_orders_path
    end
  end
  
  private 
  
    def query(amount)
      query = {
        :do => "click_n_buy",
        :server_url => reply_payments_liqpay_url,
        :result_url => reply_payments_liqpay_url,
        :version => "1.1",
        :merchant_id => "i7621615620",
        :currency => "UAH",
        :description => "Оплата товаров для " + params[:user_name],
        :order_id => params[:order_id],
        :amount => amount
      }
    end
    
    def signature
      signature_source = "|#{params[:version]}" +
                         "|OzssQB8IJKivXfMDmQbavTb9gEh4k28wmyF2VJINb1d" +
                         "|#{params[:action_name]}" +
                         "|#{params[:sender_phone]}" +
                         "|#{params[:merchant_id]}" +
                         "|#{params[:amount]}" +
                         "|#{params[:currency]}" +
                         "|#{params[:order_id]}" +
                         "|#{params[:transaction_id]}" +
                         "|#{params[:status]}" +
                         "|#{params[:code]}|"
      logger.warn signature_source
      Base64.encode64(Digest::SHA1.digest(signature_source)).chomp
    end
  
  
  
end
