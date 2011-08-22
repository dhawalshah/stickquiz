class QuestionsController < ApplicationController
  # GET /questions/1/show
  def show
    puts session.inspect
    @id = session[:question_ids][session[:current]]
    @question = Question.find @id
    session[:current] = session[:current] + 1

    if session[:current] < 10
      respond_to do |f|
        f.html
      end
    else
      redirect_to 'questions#result'
    end
  end

  # GET /questions/result
  def result
    respond_to do |f|
      f.html
    end
  end
  
end
