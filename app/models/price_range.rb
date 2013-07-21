class PriceRange < ActiveRecord::Base
	has_many :games
	
	validates :price, :presence => true
	validates :decrement_value, :presence => true
	validates :category, :presence => true
end
