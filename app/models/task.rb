class Task < ApplicationRecord
  belongs_to :list


  def self.achieved_tasks
    self.where(active: true)
  end

  def self.achieved_count
    self.where(active: true).count
  end

  def self.achieved_percent
    self.count!=0 ? ((self.achieved_count*1000/self.count)).to_f/10 : 0
  end

  def self.todo_tasks
    self.where(active: false)
  end

  def self.todo_count
    self.where(active: false).count
  end


end

