class GamesController < ApplicationController
	before_filter :authenticate_user!

	def new
		@game = Game.new
	end

	def create
		@game = Game.new params[:game]
		if @game.save
			redirect_to games_path
		else
			return 'new'
		end
	end

	def index
		@games = Game.all
	end
	
end