class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :exercise_name, :image, :exercise_type, :body_part, :exercise_description, :duration, :sets, :reps, :calories_burned
end
