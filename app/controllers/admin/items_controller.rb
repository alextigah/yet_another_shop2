class Admin::ItemsController < Admin::AdminController
  
  uses_tiny_mce  # :only => [:new, :create, :edit, :update], :class => "text_area",:options => {
  #                                 :theme => 'advanced',
  #                                 :theme_advanced_resizing => true,
  #                                 :theme_advanced_resize_horizontal => false,
  #                                 :plugins => %w{ table fullscreen }
  #                               }
  
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
