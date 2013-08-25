class ChartController < ApplicationController

#Graph displaying ID's of all users
  def user_id
    @user_list = User.all
    render :json => @user_list
  end

#Graph displaying current latitiude for all users.
  def user_lat
    @user_lat = User.all
    render :json => @user_lat
  end

# Graph with all quiz scores for current_user
  def user_quiz_scores
    @user_quiz_scores = User.all
    render :json => @user_quiz_scores
  end

# Graph displaying for a Question: users failed vs users passed
  # def question_pass_fail
  #   @question_pass_fail = Question.
end
