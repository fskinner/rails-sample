class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.datetime :date
      t.float :initial_value
      t.float :decrement_value
      t.references :user
      t.references :game_sample

      t.timestamps
    end

    add_index :rents, :game_sample_id
    add_index :rents, :user_id
  end
end