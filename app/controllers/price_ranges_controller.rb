class PriceRangesController < ApplicationController
	before_filter :authenticate_user!

	def new
		@price_range = PriceRange.new
	end

	def create
		@price_range = PriceRange.new params[:price_range]
		if @price_range.save
			redirect_to price_ranges_path
		else
			return 'new'
		end
	end

	def index
		@price_ranges = PriceRange.all
	end
	
end
