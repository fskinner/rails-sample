class CreatePriceIncrements < ActiveRecord::Migration
  def change
    create_table :price_increments do |t|
      t.float :value
      t.references :price_range
      
      t.timestamps
    end
  end
end
