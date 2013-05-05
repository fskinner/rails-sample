class CreateDeliverers < ActiveRecord::Migration
  def change
    create_table :deliverers do |t|
      t.datetime :date
      t.references :rent
      
      t.timestamps
    end
  end
end
