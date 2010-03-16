class CategoriesController < ApplicationController
  
  def index
    if params[:permalink]
      @category = Category.find_by_permalink params[:permalink]
      @items = @category.items.published.for_size(params[:size]).and_gender(params[:gender]).and_color(params[:colors]).and_brand(params[:brand]).price_range(params[:price_range]).paginate(:page => params[:page]) if @category
    else
      @items = Item.published.for_size(params[:size]).and_gender(params[:gender]).and_color(params[:colors]).and_brand(params[:brand]).price_range(params[:price_range]).paginate(:page => params[:page])
    end
    
  end
  
end

