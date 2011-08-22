class QuizzesController < ApplicationController
  before_filter :questions_left?
  
  # GET /start
  def start
    @question_ids = Question.new.gimme_questions
    session[:question_ids] = @question_ids
    session[:current] = 0
#    puts @question_ids
#    puts session.inspect
    redirect_to nextq_url 
  end

  # GET /result
  def result
    respond_to do |f|
      f.html
    end
  end

private

  def questions_left?
    @questions_left ||= 10  
  end

end
