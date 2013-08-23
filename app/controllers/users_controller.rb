class UsersController < ApplicationController

before_filter :check_if_logged_in, :except => [:new, :create, :index, :show]
# before_filter :check_if_admin, :only => [:index, :destroy]

def show
  @user = User.find(params[:id])
  respond_to do |format|
    format.html
    format.json{
      render :json => @user.to_json
    }
  end
end

def index
  @users = User.order(:name)
  render :json => @users
end

def create
  @user = User.new(params[:user])
  if @user.save
    redirect_to(root_path)
  else
    render :new
  end
end

def new
  @user = User.new
end

def edit
  @user = @current_user
  render :new
end

def update
  @user = @current_user
  if @user.update_attributes(params[:user])
    redirect_to(root_path)
  else
    @user = @user
    render :new
  end
end

def destroy
  user = User.find(params[:id])
  user.destroy
  redirect_to(users_path)
end

private
  def check_if_logged_in
    redirect_to(root_path) if @current_user.nil?
  end

  def check_if_admin
    redirect_to(root_path) if @current_user.nil? || !@current_user.is_admin?
  end
end
