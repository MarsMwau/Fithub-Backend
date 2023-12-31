class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :exercise_name
      t.string :image
      t.string :exercise_type
      t.string :body_part
      t.string :exercise_description
      t.integer :duration
      t.integer :sets
      t.integer :reps
      t.integer :calories_burned

      t.timestamps
    end
  end
end
