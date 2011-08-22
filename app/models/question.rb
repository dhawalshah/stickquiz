class Question < ActiveRecord::Base

  def all
    @all ||= self.class.all
  end

  def gimme_questions
    out = []
    max = all.length<10 ? all.length : 10
    while out.length < max
      j = rand(max) + 1 
      unless out.member? j
        out << j
      end
    end
    out
  end

end
