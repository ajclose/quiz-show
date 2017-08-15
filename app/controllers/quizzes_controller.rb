class QuizzesController < ApplicationController

  def index
    session[:quiz] = nil
    @quizzes = Quiz.all
  end

  def show
    if session[:quiz] == nil
      session[:quiz] = Quiz.find(params[:id])
      questions = session[:quiz].questions.map do |question|
        question.id
      end
      session[:questions] = questions.shuffle
      session[:correct] = 0
    end

    puts session[:questions].inspect
    @quiz = Quiz.find(params[:id])
    @question_id = session[:questions].pop
    @question = Question.find(@question_id)
    @answers = @question.answers.shuffle
  end

  def check
    @quiz = Quiz.find(params[:id])
    @answer = Answer.find(params[:answer])
    if @answer.correct == true
      session[:correct] += 1
    end
    if session[:questions].length == 0
      redirect_to root_path
    else
      redirect_to quiz_path(@quiz)
    end

  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new
    @quiz.title = params[:quiz][:title]
    @quiz.description = params[:quiz][:description]
    if @quiz.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
    if @quiz.published == true
      redirect_to root_path, notice: "Quiz can no longer be edited"
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.published == true
      redirect_to root_path, notice: "Quiz can no longer be edited"
    else
      @quiz.title = params[:quiz][:title]
      @quiz.description = params[:quiz][:description]
      if @quiz.save
        redirect_to root_path
      else
        render :edit
      end
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to root_path
  end
end
