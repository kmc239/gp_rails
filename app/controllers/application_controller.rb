class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #before_filter :http_auth
  
  protected
  
  def http_auth
    authenticate_or_request_with_http_basic do |user_name, password|
      
      user = User.find_by_email(user_name)
    
      if user && user.authenticate(password)
        true
      else
        false
      end
      
    end
  end
  
end
