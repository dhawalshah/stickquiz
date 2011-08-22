class Question < ActiveRecord::Base

  def all
    @all ||= self.class.all
  end
    
  # alternate version
  def gimme_ten
    tenvalues = 10
    j = Array.new(tenvalues)
    0.upto(tenvalues-1) do |i|
      j[i] = rand(all.length - 1)
    end
    j
  end
  
end
