class QuizzesController < ApplicationController

  def new
  end

  def create
  end

  def show
    @quiz = Quiz.find_by_slug(params[:id])
    @user_quiz = UserQuiz.create(:user_id => 1, :quiz_id => @quiz.id)
    @user_answer = UserAnswer.new
    @questions = @quiz.questions
    # binding.pry
  end

  def index
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
