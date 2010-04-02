class BrandsController < ApplicationController
  
  def show
    @brand = Brand.find_by_permalink params[:permalink]
  end
  
end
