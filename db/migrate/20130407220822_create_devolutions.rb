class CreateDevolutions < ActiveRecord::Migration
  def change
    create_table :devolutions do |t|
      t.datetime :date
      t.integer :midia_status
      t.references :rent
      
      t.timestamps
    end
  end
end
