class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists
  has_many :tasks, through: :lists

  def achieved_tasks
    tasks.where(active: true)
  end

  def achieved_count
    tasks.where(active: true).count
  end

  def achieved_percent
    total!=0 ? (1000*achieved_count/total).to_f/10 : 0
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
