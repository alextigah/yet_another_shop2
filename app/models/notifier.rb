class Notifier < ActionMailer::Base
  
  def privatmoney(order)
    recipients    order.email
    from          "order@shuttle.in.ua"
    subject       "Оплата PrivatMoney"
    sent_on       Time.now
    body          :order => order    
  end
  
  def order(order)
    recipients    order.email
    from          "order@shuttle.in.ua"
    subject       "Оплата заказа #SHUTTLE-" + order.id.to_s
    sent_on       Time.now    
    body          :order => order
  end
  
  def admin_order(order)
    recipients    "i@shuttle.in.ua"
    from          "order@shuttle.in.ua"
    subject       "Оплата заказа #SHUTTLE-" + order.id.to_s
    sent_on       Time.now    
    body          :order => order      
  end
   
   

end
