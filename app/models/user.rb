class User < ApplicationRecord
    has_many :weight_trackings
    has_many :workout_plans
    has_many :exercises, through: :workout_plans
    has_many :calorie_intakes
    
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }
end
