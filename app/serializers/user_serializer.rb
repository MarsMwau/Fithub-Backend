class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :age, :gender, :height, :initial_weight, :target_weight
  has_many :workout_plans 
end
