class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "Params >> #{params}"
    @user = User.find_by(name: params[:user][:name])
    puts "Username >> #{params[:user][:name]}"
    if (!@user.nil?) then
      puts "User >> #{@user.id}, #{@user.name}"
    else
      puts "User is not found!!"
    end
    return head(:forbidden) unless !@user.nil? && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to users_path
  end
end
