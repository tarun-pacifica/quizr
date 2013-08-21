class QuizzesController < ApplicationController

  def new
  end

  def create
  end

  def show
    @user_answer = UserAnswer.new
    @quiz = Quiz.find(params[:id])
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
