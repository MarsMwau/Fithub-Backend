class User < ApplicationRecord
    has_many :weight_trackings
    has_many :workout_plans

    has_secure_password
end
