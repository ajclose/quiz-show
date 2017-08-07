class QuestionsController < ApplicationController

  before_action do
    @quiz = Quiz.find(params[:quiz_id])
  end

  def index
    @questions = @quiz.questions
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new
    @question.body = params[:question][:body]
    @question.quiz_id = params[:quiz_id]
    if @question.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.body = params[:question][:body]
    if @question.save
      redirect_to quiz_path(@quiz)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to quiz_path(@quiz)
  end

end
