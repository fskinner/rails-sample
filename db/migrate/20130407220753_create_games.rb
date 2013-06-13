class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.boolean :available
      t.string :identifier
      t.references :console
      t.references :gender
      t.references :price_range
      t.references :rent
      t.references :devolution

      t.timestamps
    end

    add_index :games, :price_range_id
    add_index :games, :console_id
    add_index :games, :gender_id
    add_index :games, :rent_id
    add_index :games, :devolution_id

  end
end
