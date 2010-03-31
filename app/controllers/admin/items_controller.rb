class Admin::ItemsController < Admin::AdminController
  
  def new
     @item = Item.new
     @item.photos.build     
  end
  
  # def create
  #   raise params.inspect
  # end
  
end
