class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.datetime :date
      t.float :initial_value
      t.references :user
      t.references :game

      t.timestamps
    end
  end
end
