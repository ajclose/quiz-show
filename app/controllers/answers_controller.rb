class AnswersController < ApplicationController

  before_action do
    @question = Question.find(params[:question_id])
  end

  def index

  end

  def new
    @answer = Answer.new
  end

  def create
    puts request.params[:answer][:correct]
    @quiz = Quiz.find(@question.quiz_id)
    @answer = Answer.new
    @answer.body = params[:answer][:body]
    if params[:answer][:correct] == "true"
      @answer.correct = true
    elsif params[:answer][:correct] == "false"
      puts "answer is false"
      @answer.correct = false
    end
    @answer.question_id = params[:question_id]
    if @answer.save
      redirect_to edit_quiz_question_path(@quiz, @question)
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @quiz = Quiz.find(@question.quiz_id)
    @answer = Answer.find(params[:id])
    @answer.body = params[:answer][:body]
    @answer.correct = params[:answer][:correct]
    @answer.question_id = params[:question_id]
    if @answer.save
      redirect_to edit_quiz_question_path(@quiz, @question)
    else
      render :new
    end
  end

  def destroy
    @quiz = Quiz.find(@question.quiz_id)
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to edit_quiz_question_path(@quiz, @question)
  end
end
