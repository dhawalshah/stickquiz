class QuestionsController < ApplicationController
  # GET /questions/1
  def show
    @id = params[:question_ids][params[:current]]
    @question = Question.find @id
    params[:current] = params[:current] + 1

    if params[:current] < 10
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
