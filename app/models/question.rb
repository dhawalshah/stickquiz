class Question < ActiveRecord::Base

  def all
    @all ||= self.class.all
  end
    
  # alternate version
#   def gimme_ten
#     j = Array.new(tenvalues)
#     0.upto(tenvalues-1) do |i|
#       j[i] = rand(all.length - 1)
#     end
#     j
#   end

  def gimme_questions
    out = []
    max = all.length<10 ? all.length : 10
    while out.length < max
      j = rand(max)
      unless out.member? j
        out << j+1
      end
    end
    out
  end

end
