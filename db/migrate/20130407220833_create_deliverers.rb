class CreateDeliverers < ActiveRecord::Migration
  def change
    create_table :deliverers do |t|
      t.datetime :date
      t.boolean :has_returned
      t.references :rent
      
      t.timestamps
    end

    add_index :deliverers, :rent_id
  end
end
