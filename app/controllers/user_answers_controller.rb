class UserAnswersController < ApplicationController
  def create
    answer = Answer.where(:id => params[:user_answer][:answer_id]).first
    @quiz = answer.question.quiz
    @user_quiz = @current_user.user_quizzes.where(:quiz_id => @quiz.id).first
    @user_answer = UserAnswer.new(:answer_id => answer.id, :question_id => answer.question_id, :user_quiz_id => @user_quiz.id )
    if @user_answer.save
      :flash => { :success => "Answer successful" }
    else
      :flash => { :error => "You have already answered this question"}
    end
  end
end
