class RentsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@rents = Rent.where user_id: current_user.id
	end

	def return_game
		@rent = Rent.find params[:id]
		@rent.return_game current_user
		redirect_to rents_url
	end
	
end
