class CreatePriceRanges < ActiveRecord::Migration
  def change
    create_table :price_ranges do |t|
      t.float :price
      t.string :category

      t.timestamps
    end
  end
end
