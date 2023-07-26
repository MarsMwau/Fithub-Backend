class User < ApplicationRecord
    has_many :weight_trackings
    has_many :workout_plans
    has_many :exercises, through: :workout_plan
end
