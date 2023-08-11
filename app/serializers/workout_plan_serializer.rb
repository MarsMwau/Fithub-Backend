class WorkoutPlanSerializer < ActiveModel::Serializer
  attributes :id, :date, :status
  has_many :exercises
end
