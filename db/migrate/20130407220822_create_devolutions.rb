class CreateDevolutions < ActiveRecord::Migration
  def change
    create_table :devolutions do |t|
      t.datetime :date
      t.integer :midia_status
      t.boolean :has_returned
      t.references :rent
      
      t.timestamps
    end

    add_index :devolutions, :rent_id
  end
end
