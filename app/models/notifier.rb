class Notifier < ActionMailer::Base
  
  def privatmoney(email)
    recipients    email
    from          "order@shuttle.in.ua"
    subject       "Оплата PrivatMoney"
    sent_on       Time.now
  end
  
  def order(order)
    recipients    order.email
    from          "order@shuttle.in.ua"
    subject       "Номер заказа SHUTTLE-" + order.id.to_s
    sent_on       Time.now    
    body          :order => order
  end
   
   

end
