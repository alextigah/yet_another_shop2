class CategoriesController < ApplicationController
  
  def index
    if params[:permalink]
      @category = Category.find_by_permalink params[:permalink]
      @items = @category.items.published.for_size(params[:size]).and_gender(params[:gender]).price_range(params[:price_range]) if @category
    else
      @items = Item.published
    end
    
  end
  
end
