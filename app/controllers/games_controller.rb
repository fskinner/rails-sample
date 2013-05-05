class GamesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@games = Game.where available: true
	end

	def rent
		@game = Game.find params[:id]

		# @game.rent current_user
		# redirect_to root_url
	end

	def rent_money
		@game = Game.find params[:id]
		
		@game.rent_money current_user
		redirect_to root_url
	end

	def rent_credit
		@game = Game.find params[:id]
		if @game.rent_credit current_user
			redirect_to root_url
		else
			render 'rent'
		end
	end
	
end
