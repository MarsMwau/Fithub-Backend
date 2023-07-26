class CreateWeightTrackings < ActiveRecord::Migration[6.1]
  def change
    create_table :weight_trackings do |t|
      t.references :user, null: false, foreign_key: true
      t.float :weight
      t.date :date

      t.timestamps
    end
  end
end
