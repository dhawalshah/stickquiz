class QuizzesController < ApplicationController
  before_filter :questions_left?
  
  # GET /quizzes
  # GET /quizzes.xml
  def index
    @questions = Question.gimme_ten
    
    puts @questions
    
    if @questions_left > 0
      respond_to do |format|
        format.html # index.html.erb
      end
    else
      redirect_to :result
    end
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
