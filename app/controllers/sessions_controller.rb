class SessionsController < ApplicationController
  
  def destroy
    # session.delete(:user_id)
    session.destroy
    redirect_to login_path
  end


end