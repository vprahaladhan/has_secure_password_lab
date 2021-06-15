class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:username])
    puts "Username >> #{params[:username]}"
    if (!@user.nil?) then
      puts "User >> #{@user.id}, #{@user.name}"
    else
      puts "User is not found!!"
    end
    return head(:forbidden) unless !@user.nil? && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to users_path
  end
end
