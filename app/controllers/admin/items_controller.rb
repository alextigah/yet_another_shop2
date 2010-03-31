class Admin::ItemsController < Admin::AdminController
  
  def new
     @item = Item.new
     @item.photos.build     
  end
  
  # def create
  #   raise params.inspect
  # end
  
  def search
    @items = Item.find(:all, :conditions => {:code => params[:item][:query]})
    render :action => "index"
  end
  
end
