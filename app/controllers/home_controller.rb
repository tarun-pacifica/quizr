class HomeController < ApplicationController
  def index
    @quizzes = Quiz.all
    @users = User.all
  end

  # Renders graph data as json object
  def chart_users
    @user_list = User.all
    render :json => @user_list
  end

  def chart_user_dates
    @create_date = User.first.created_at
    render :json => @create_date
  end
end