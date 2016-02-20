class Result < ActiveRecord::Base


  def student
    "#{name} #{surname} #{group}"
  end

end
