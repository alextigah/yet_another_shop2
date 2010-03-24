class MainController < ApplicationController

  def index
    @items = Item.published.limit(10)
    httpauth = Twitter::HTTPAuth.new('_gra', 'zscezsce5')
    client = Twitter::Base.new(httpauth)    
    @messages = client.user_timeline(:id => "shuttle_ua", :count => 5)
  end

end
