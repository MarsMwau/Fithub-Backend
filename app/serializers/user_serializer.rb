class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :age, :gender, :height, :initial_weight, :target_weight
  has_many :workout_plans 
end
