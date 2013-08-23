class ChartController < ApplicationController
  def user_id
    @user_list = User.all
    render :json => @user_list
  end

  def user_lat
    @user_lat = User.all
    render :json => @user_lat
  end
end
