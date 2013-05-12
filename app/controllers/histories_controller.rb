class HistoriesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@histories = History.where user_id: current_user
	end
	
end
