class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.references :console
      t.references :gender
      t.references :price_range

      t.timestamps
    end

    add_index :games, :price_range_id
    add_index :games, :console_id
    add_index :games, :gender_id

  end
end
