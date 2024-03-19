class UsersController < ApplicationController

   def index 
      # require 'pry'; binding.pry
      @user = User.find(params[:user_id])
   end

   def new
      @user = User.new
   end

   def show
      @user = User.find(params[:id])
   end

   def create
      user = User.new(user_params)
      if user.save
         flash[:success] = 'Successfully Created New User'
         redirect_to user_path(user)
      else
         flash[:error] = "#{error_message(user.errors)}"
         redirect_to register_user_path
      end   
   end




private

#   def user_params
#       params.require(:user).permit(:name, :email)
#   end

  def user_params
      params.permit(:name, :email)
  end

end