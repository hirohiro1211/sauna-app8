class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :sauna
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_plan

  validates :date, presence: true
  validates :time_plan_id, numericality:{ other_than: 1 }
end
