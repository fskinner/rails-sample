class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :bank
      t.string :agency
      t.string :account
      t.integer :shopcredit

      t.timestamps
    end
  end
end
