class HomeController < ApplicationController
  def index
    @quizzes = Quiz.all
    @leaderboard = User.order("total_score DESC")
  end
end