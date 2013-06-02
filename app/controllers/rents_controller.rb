class RentsController < ApplicationController
	before_filter :authenticate_user!

	def index
		current_user_id = current_user.id
		@rents = Rent.where{(user_id == current_user_id) & (date != nil)}
	end

	def return_game
		@rent = Rent.find params[:id]
		@rent.request_return current_user
		redirect_to rents_url
	end

	def admin
		if current_user.role == "admin"
			@rents = Rent.where{date == nil}
		end
	end

	def devolution
		if current_user.role == "admin"
			@devolutions = Devolution.where{date == nil}
		end
	end

	def accept_rent
		@rent = Rent.find params[:id]
		@rent.accept_rent
		redirect_to admin_rents_url
	end

	def confirm_devolution
		@rent = Rent.find params[:id]
		@devolution = @rent.devolution
		@devolution.confirm_return
		redirect_to devolution_rents_url
	end
	
end
