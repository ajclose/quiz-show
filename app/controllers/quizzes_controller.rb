class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
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
