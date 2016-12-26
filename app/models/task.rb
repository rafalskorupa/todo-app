class Task < ApplicationRecord


  def upcount
    Random.rand(120)
  end
end
