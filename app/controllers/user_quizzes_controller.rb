class UserQuizzesController < ApplicationController

  def create
    binding.pry
    @user_quiz = UserQuiz.create(:user_id => @current_user.id, :quiz_id => @quiz.id)
    redirect_to @quiz
  end
end
