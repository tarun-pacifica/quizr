class UsersController < ApplicationController
  def show
    @user = User.find_by_slug(params[:id])
  end

  def index
  end
end
