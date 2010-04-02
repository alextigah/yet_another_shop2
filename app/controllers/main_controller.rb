class MainController < ApplicationController

  def index
    @items = Item.published.limit(15)
#    @sales = Sale.published.limit(3)
    @sale = Sale.published.random.first
    # httpauth = Twitter::HTTPAuth.new('_gra', 'zscezsce5')
    # client = Twitter::Base.new(httpauth)    
    # @messages = client.user_timeline(:id => "shuttle_ua", :count => 5)
  end

end
