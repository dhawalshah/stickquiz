class QuestionsController < ApplicationController
  # GET /nextq
  def nextq

    respond_to do |f|
      f.html
    end
  end

  # GET /next.js
  def next
    @current = session[:current]
    @id = session[:question_ids][@current]
    @question = Question.find @id
    session[:current] = @current + 1
    
    # TODO -- test data, needs to be incorporated into Question model
    @random_data = [['Mon', rand*100, rand*100, rand*100, rand*100],
                    ['Tue', rand*100, rand*100, rand*100, rand*100],
                    ['Wed', rand*100, rand*100, rand*100, rand*100],
                    ['Thu', rand*100, rand*100, rand*100, rand*100],
                    ['Fri', rand*100, rand*100, rand*100, rand*100]
                   ]

    @hash = { :question => @current,
              :qid      => @id,
              :image    => @question.image,
              :answer   => @question.answer 
            }

    respond_to do |format|
      format.js
    end
  end
end
