class Exercise < ApplicationRecord
    has_many :workout_plans, dependent: :destroy
    has_many :users, through: :workout_plans
end
