class Exercise < ApplicationRecord
    has_and_belongs_to_many :workout_plans
    has_many :users, through: :workout_plans
end
