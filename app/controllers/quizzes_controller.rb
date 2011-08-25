class QuizzesController < ApplicationController
  
  # GET /start
  def start
    @question_ids = Question.new.gimme_questions
    session[:question_ids] = @question_ids
    session[:current] = 0
    session[:submitted_answer] =  Array.new(10)
#    puts @question_ids
#    puts session.inspect
    redirect_to nextq_url 
  end

  # GET /result
  def result
    @qids = session[:question_ids]
    @questions = @qids.map {|id| Question.find id}
    @correct_answers = @questions.map {|q| Option.find(q.answer).name }
    @submitted_answers = session[:submitted_answer].map {|id| 
      if id.nil?
        "Not answered"
      elsif id == "too_slow"
        "Time limit exceeded"
      else
        Option.find(id).name
      end
    }
    respond_to do |f|
      f.html
    end
  end

end
