class QuizzesController < ApplicationController
  before_filter :if_logged_in
  def new
    @quiz = Quiz.new
    respond_to do |format|
      format.html
      format.json  { render :json => @quiz }
    end
  end

  def create
    @quiz = Quiz.new(params[:quiz])
    @quiz.user_id = @current_user.id

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to(root_path, :notice => 'Quiz was successfully created.') }
        format.json  { render :json =>root_path, :status => :created, :location => @quiz }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @quiz = Quiz.find_by_slug(params[:id])
    # @user_quiz = UserQuiz.create(:user_id => @current_user.id, :quiz_id => @quiz.id)
    @user_answer = UserAnswer.new
    @questions = @quiz.questions
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
