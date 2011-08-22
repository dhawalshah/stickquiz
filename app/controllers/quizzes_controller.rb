class QuizzesController < ApplicationController
  before_filter :questions_left?
  
  # GET /quizzes
  # GET /quizzes.xml
  def index
    @question_ids = Question.new.gimme_ten
    params[:question_ids] = @question_ids
    params[:current] = 0
    redirect_to 'questions#show'
  end
  
private
  
  def questions_left?
    @questions_left ||= 10  
  end
  
end
