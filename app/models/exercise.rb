class Exercise < ApplicationRecord
    has_many :workout_plans
    has_many :users, through: :workout_plans
end
