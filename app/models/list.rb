class List < ApplicationRecord
  has_many :tasks
  belongs_to :user


  def achieved_tasks
    tasks.where(active: true)
  end

  def achieved_count
    tasks.where(active: true).count
  end

  def achieved_percent
    total!=0 ? ((achieved_count*1000/total)).to_f/10 : 0
  end

  def todo_tasks
    tasks.where(active: false)
  end

  def todo_count
    tasks.where(active: false).count
  end

  def total
    tasks ? tasks.count : nil
  end


  def can_modify_tasks(current_user)
    current_user == user ? true : false
  end
end
