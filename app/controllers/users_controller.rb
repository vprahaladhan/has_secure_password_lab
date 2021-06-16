class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    if user_params[:password] == user_params[:password_confirmation] then 
      puts "Params > #{user_params}"
      @user = User.create(user_params)
      puts "@User > #{@user.name}, #{@user.id}"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to(controller: 'users', action: 'new')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end