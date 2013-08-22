class UserQuizzesController < ApplicationController

  def create
    @user_quiz = UserQuiz.create(:user_id => @current_user.id, :quiz_id => params["quiz_id"])
    redirect_to quiz_path(params["quiz_slug"])
  end
end
