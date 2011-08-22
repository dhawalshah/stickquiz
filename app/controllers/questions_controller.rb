class QuestionsController < ApplicationController
  # GET /nextq
  def nextq
#    puts session.inspect
    @id = session[:question_ids][session[:current]]
    @question = Question.find @id
    session[:current] = session[:current] + 1

    if session[:current] < 10
      respond_to do |f|
        f.html
      end
    else
      redirect_to result_url
    end
  end
end
