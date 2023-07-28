class WorkoutPlanSerializer < ActiveModel::Serializer
  attributes :exercise_id, :date
  belongs_to :exercise
end
