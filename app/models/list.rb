class List < ApplicationRecord
  has_many :tasks

  def achieved_tasks
    tasks.where(active: true)
  end

  def achieved_count
    tasks.where(active: true).count
  end

  def todo_tasks
    tasks.where(active: false)
  end

  def todo_count
    tasks.where(active: false).count
  end

  def total
    tasks.count
  end
end
