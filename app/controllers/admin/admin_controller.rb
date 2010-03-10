class Admin::AdminController < InheritedResources::Base
  
  layout 'admin'
  
  skip_before_filter :setup
  
end
