class CreateGameSamples < ActiveRecord::Migration
  def change
    create_table :game_samples do |t|
      t.boolean :available
      t.string :identifier
      t.references :rent
      t.references :devolution
      t.references :game

      t.timestamps
    end
    add_index :game_samples, :rent_id
    add_index :game_samples, :devolution_id
    add_index :game_samples, :game_id
  end
end
