class CreateWorkoutPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.boolean :status
      t.timestamps
    end
  end
end
