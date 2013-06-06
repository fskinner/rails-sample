class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.float :value
      t.string :transaction_type
      t.string :message
      t.string :currency
      t.datetime :date
      t.references :rent
      t.references :user

      t.timestamps
    end
    add_index :histories, :rent_id
  end
end
