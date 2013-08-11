class PriceRangesController < ApplicationController
	before_filter :authenticate_user!

	def new
		@price_range = PriceRange.new
	end

	def edit
		@price_range = PriceRange.find params[:id]
	end

	def update
		@price_range = PriceRange.find params[:id]
		if @price_range.update_attributes params[:price_range]
			redirect_to price_ranges_path
		else
			return 'edit'
		end
  	end

	def create
		@price_range = PriceRange.new params[:price_range]
		if @price_range.save
			redirect_to price_ranges_path
		else
			return 'new'
		end
	end

	def destroy
		@price_range = PriceRange.find params[:id]
		@price_range.destroy
    	redirect_to price_ranges_path
  	end

	def index
		@price_ranges = PriceRange.all
	end
	
end
