class CreatePriceRanges < ActiveRecord::Migration
  def change
    create_table :price_ranges do |t|
      t.float :price
      t.float :increment_value
      t.integer :periodicity
      t.string :category

      t.timestamps
    end
  end
end
