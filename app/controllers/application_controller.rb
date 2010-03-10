# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password

  before_filter :setup

  protected

    def setup
      @pages = Page.published
      @categories = Category.published
      @order = Order.find_by_id(session[:order_id]) or session[:order_id] = Order.create.id
      # raise Order.create.errors.inspect
    end
  
  
  
end
