class Question < ActiveRecord::Base
  
  def initialize
    @all = self.all
  end
  
  def gimme_ten
    randomize_this.map {|i| @all[i]}
  end
  
  # alternate version
  def randomize_this
    j = Array.new(10)
    0.upto(9) do |i|
      j[i] = rand(@all.length - 1)
    end
    j
  end
  
end
