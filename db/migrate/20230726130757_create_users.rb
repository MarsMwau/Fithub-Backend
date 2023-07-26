class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :gender
      t.integer :height
      t.float :initial_weight
      t.float :target_weight

      t.timestamps
    end
  end
end
