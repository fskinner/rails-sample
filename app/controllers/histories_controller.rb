class HistoriesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@histories = History.where user_id: current_user
	end

	def new
		@history = History.new
	end

	def create
		@history = History.new params[:history]
		if History.retrieve_credits current_user, @history.value
			redirect_to root_url
		else
			return 'new'
		end
	end
	
end
