class QuizzesController < ApplicationController
  before_filter :questions_left?
  
  # GET /quizzes
  # GET /quizzes.xml
  def index
    @question_ids = Question.new.gimme_questions
    session[:question_ids] = @question_ids
    session[:current] = 0
    puts @question_ids
    puts session.inspect
    redirect_to questions_url
  end
  
private
  
  def questions_left?
    @questions_left ||= 10  
  end
  
end
