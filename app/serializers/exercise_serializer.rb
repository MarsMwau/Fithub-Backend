class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :exercise_name, :image, :exercise_type, :body_part, :duration, :sets, :reps, :status, :calories_burned
end
