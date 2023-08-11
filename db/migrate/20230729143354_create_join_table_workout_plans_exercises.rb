class CreateJoinTableWorkoutPlansExercises < ActiveRecord::Migration[6.1]
  def change
    create_join_table :workout_plans, :exercises do |t|
       t.index [:workout_plan_id, :exercise_id]
       t.index [:exercise_id, :workout_plan_id]
    end
  end
end
