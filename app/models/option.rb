class Option < ActiveRecord::Base
  def all
    @all ||= self.class.all
  end

  def gimme_options(answer)
    out = []
    out << { :id => answer, :value => self.class.find(answer).name }
    max = 4
    while out.length < max
      j = rand(all.length) + 1 
      unless out.map{|o| o[:id]}.member? j
        out << { :id => j, :value => self.class.find(j).name }      
      end
    end
    puts out
    out.shuffle
  end
end