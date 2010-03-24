class Payments::LiqpayController < ApplicationController
  
  def create
    server = URI.parse "https://liqpay.com"
    server.query = URI.encode query(params[:amount]).map {|k,v| "#{k}=#{v}"}.join("&")
    redirect_to server.to_s
  end
  
  def reply
    case params[:status] 
    when "wait_secure"
      render :text => "транзакция на стадии проверки"
    when "success"
      if signature == params[:signature]
        # ORDER PAY
        render :text => "ok"
      end
    else
      render :text => "транзакция отменена"
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
        :description => " " + current_user.name,
        :order_id => current_user.id,
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
