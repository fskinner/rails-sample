class GendersController < ApplicationController
	before_filter :authenticate_user!

	def show
		@gender = Gender.find params[:id]
		@games = Game.where gender_id: params[:id]
	end

	def index
		@genders = Gender.all
	end
	
end
