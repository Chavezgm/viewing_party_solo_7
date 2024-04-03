class ApplicationController < ActionController::Base
   helper_method :current_user
  
   
   helper_method 

   def error_message(errors)
      errors.full_messages.join(', ')
   end
   def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
   end

end
