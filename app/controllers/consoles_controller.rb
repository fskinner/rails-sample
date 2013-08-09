class ConsolesController < ApplicationController
	before_filter :authenticate_user!
	
	def new
		@console = Console.new
	end

	def create
		@console = Console.new params[:console]
		if @console.save
			redirect_to consoles_path
		else
			return 'new'
		end
	end

	def show
		@console = Console.find params[:id]
		@games = Game.where console_id: params[:id]
	end

	def index
		@consoles = Console.all
	end
	
end
