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
      # require 'pry'; binding.pry
      user = user_params

      user[:name] = user[:name].downcase
      new_user = User.create(user)
      if new_user.save
         flash[:success] = "Welcome, #{new_user.name} you have now been registered!"
         redirect_to user_path(new_user)
      else
         flash[:error] = "#{error_message(new_user.errors)}"
         redirect_to register_user_path
      end   
   end

   def login_form
   end

   def login_user
      # require 'pry'; binding.pry
      user =  User.find_by(email: params[:email])
      if user.authenticate(params[:password])  # if user.password == params[:password]
        
         session[:user_id] = user.id 
         cookies[:user_location] = { value: params[:location] }
         # require 'pry'; binding.pry
         flash[:success] = "Welcome, #{user.name}"
         redirect_to user_path(user)
      else 
         flash[:error] = "You entered Incorrect Credentials"
         render :login_form
         # require 'pry'; binding.pry
      end 
   end



private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end