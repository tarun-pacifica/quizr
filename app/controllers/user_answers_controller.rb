class UserAnswersController < ApplicationController
  after_filter :update_score, :only => :create
  def create
    answer = Answer.where(:id => params[:user_answer][:answer_id]).first
    @quiz = answer.question.quiz
    @user_quiz = @current_user.user_quizzes.where(:quiz_id => @quiz.id).last
    @user_answer = UserAnswer.new(:answer_id => answer.id, :question_id => answer.question_id, :user_quiz_id => @user_quiz.id, :is_correct => answer.is_correct )
    if @user_answer.save
      flash[:notice] = "Answer successful"
    else
      flash[:notice] = "You have already answered this question"
    end
  end

  def update_score
    @user_quiz = @current_user.user_quizzes.where(:quiz_id => @quiz.id).last
    @user_quiz.update_attributes(:score => @user_quiz.score_percent)
  end
end
