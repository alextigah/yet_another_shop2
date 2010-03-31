class Admin::AdminController < InheritedResources::Base
  
  layout 'admin'
  
  skip_before_filter :setup
  
	before_filter :authenticate  
  
	private
	def authenticate
		authenticate_or_request_with_http_basic do |user_name, password|
		user_name == "admin" && password == "ktotulen"
		end
	end  
  
end
