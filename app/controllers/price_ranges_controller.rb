class PriceRangesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@price_ranges = PriceRange.all
	end
	
end
