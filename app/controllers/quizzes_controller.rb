class QuizzesController < ApplicationController

  def new
  end

  def create
  end

  def show
    @quiz = Quiz.find(params[:id])
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
