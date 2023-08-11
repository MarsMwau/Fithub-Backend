class CreateCalorieIntakes < ActiveRecord::Migration[6.1]
  def change
    create_table :calorie_intakes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :calories
      t.date :date

      t.timestamps
    end
  end
end
