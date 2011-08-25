class QuestionsController < ApplicationController
  # GET /nextq
  def nextq
    #in seconds
    @timerDuration = 10
    @current = session[:current]

    if request.post?
      params[:answer] ? session[:submitted_answer][@current - 1] = params[:answer] : session[:submitted_answer][@current - 1] = "too_slow"
      puts "The submitted answer id is #{session[:submitted_answer][@current - 1]}"
    end
    #go to results once 10 questions 

    if @current >= 10
      redirect_to result_url
    else
      puts "Question no. #{@current}:"
      @id = session[:question_ids][@current]
      @question = Question.find @id
      @options = Option.new.gimme_options(@question.answer)
      puts "Question id is #{@id} and answer id is #{@question.answer}"
      session[:current] = @current + 1
    
      respond_to do |f|
          f.html
      end
    end
  end
  
end

