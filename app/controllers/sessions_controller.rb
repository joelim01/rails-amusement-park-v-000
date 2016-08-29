class SessionsController < ApplicationController

  def new
    redirect_if_logged_in
    @user = User.new
  end

  def create
    redirect_if_logged_in
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end


private


end
