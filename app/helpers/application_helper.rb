# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def price_print(price)
    price.to_i
  end
  
  def order
    @order
  end
  
  def select?(category)
    if request.request_uri.include?(category.permalink)
      "active"
    end
  end

	def make_query(key, value)
    if !params[key.to_sym]
      add_query(key, value) 
    elsif params[key.to_sym] != value 
      add_query(key, value)     
    else
      remove_query(key)
    end
	end
	
  def remove_query(key)
     url, query = request.request_uri.split("?")

     if query && query.include?(key)
       res = []
       params = CGI::parse(query)
       params.delete(key)
       params.each_pair {|k,v| res << k.to_s + "=" + v.to_s}      

       url + "?" + res.join("&")
     else
       request.request_uri
     end
   end 
   

   def add_query(key, value)
     url, query = request.request_uri.split("?")

     if query
       res = []
       params = CGI::parse(query)
       params[key] = value
       params.each_pair {|k,v| res << k.to_s + "=" + v.to_s}
       url + "?" + res.join("&")
     end
   end
  
end
