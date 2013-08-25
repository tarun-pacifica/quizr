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
    a = @current_user.user_quizzes
    @a = a.joins(:quiz).collect {|a| { :name => a.quiz.name,:score => a.score,:date => a.updated_at} }
    render :json => @a
  end

  # def user
  #   a = UserAnswer.where(:question_id => 44, :is_correct => false).count

end
