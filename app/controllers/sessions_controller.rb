class SessionsController < ApplicationController
  def new
  end

  def create
    #creates the new session
    user = User.where(:name => params[:username]).first
    if user.present? && user.authenticate(params[:password])
      #upon authentication redirect to root path
      session[:user_id] = user.id
      redirect_to(root_path)
    else
      #else if authentication is unsuccessful, redirect to login path
      flash[:notice] = "Your password is incorrect buddy, try again."
      redirect_to(login_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
