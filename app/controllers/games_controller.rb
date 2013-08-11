class GamesController < ApplicationController
	before_filter :authenticate_user!

	def new
		@game = Game.new
	end

	def edit
		@game = Game.find params[:id]
	end

	def update
		@game = Game.find params[:id]
		if @game.update_attributes params[:game]
			redirect_to games_path
		else
			return 'edit'
		end
  	end

	def create
		@game = Game.new params[:game]
		if @game.save
			redirect_to games_path
		else
			return 'new'
		end
	end

	def destroy
		@game = Game.find params[:id]
		@game.destroy
    	redirect_to games_path
  	end

	def index
		@games = Game.all
	end
	
end