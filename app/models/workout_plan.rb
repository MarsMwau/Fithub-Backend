class WorkoutPlan < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :exercises
end
