class PriceRange < ActiveRecord::Base
	validates :price, :presence => true
	validates :category, :presence => true
end
