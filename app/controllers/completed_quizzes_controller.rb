class CompletedQuizzesController < ApplicationController

  def new
    @completed_quiz = CompletedQuiz.new
  end

  def create
    @completed_quiz = CompletedQuiz.new
    @completed_quiz.quiz_id = session[:quiz]
    @completed_quiz.user_id = session[:user_id]
    @completed_quiz.score = session[:correct]
    @completed_quiz.save
    redirect_to score_path(@completed_quiz)
  end

  def show
    @completed_quiz = CompletedQuiz.find(params[:id])
  end
end
