class UsersController < ApplicationController
  
  def new

  end

  def create
    if user_params[:password] == user_params[:password_confirmation] then 
      @user = User.create(user_params)
      # @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to(controller: 'users', action: 'new')
    end
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end