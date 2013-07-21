class CreatePriceRanges < ActiveRecord::Migration
  def change
    create_table :price_ranges do |t|
      t.float :price
      t.float :decrement_value
      t.string :category

      t.timestamps
    end
  end
end
