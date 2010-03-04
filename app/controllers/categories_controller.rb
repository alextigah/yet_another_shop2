class CategoriesController < ApplicationController
  
  def index
    if params[:permalink]
      @category = Category.find_by_permalink params[:permalink]
      @items = @category.items.published if @category
    else
      @items = Item.published
    end
    
  end
  
end
