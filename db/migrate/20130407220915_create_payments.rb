class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :date
      t.integer :type
      t.float :value
      t.references :rent

      t.timestamps
    end
  end
end
