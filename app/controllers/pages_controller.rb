class PagesController < ApplicationController

  def show
    @page = Page.find params[:permalink]
  end

end
