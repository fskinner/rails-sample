class ConsolesController < ApplicationController
	before_filter :authenticate_user!
	def show
		@console = Console.find params[:id]
		@games = Game.where console_id: params[:id]
	end

	def index
		@consoles = Console.all
	end
	
end
