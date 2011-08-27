class QuestionsController < ApplicationController
  # GET /nextq
  def nextq
    #in seconds
    @timerDuration = session[:timerDuration]
    @current = session[:current]

    if request.post? && !(@current > 10)
      params[:answer] ? session[:submitted_answer][@current - 1] = params[:answer] : session[:submitted_answer][@current - 1] = "too_slow"
      puts "The submitted answer id is #{session[:submitted_answer][@current - 1]}"
    end
    
    #go to results once 10 questions 
    if @current >= 10
      return redirect_to result_url
    else
      @id = session[:question_ids][@current]
      @question = Question.find @id
      @options = Option.new.gimme_options(@question.answer)  
      session[:current] = @current + 1
      puts "Question #{@current+1}:"
      puts "Question id is #{@id} and answer id is #{@question.answer}"
      respond_to do |f|
          f.html
      end
    end
  end
  
end

