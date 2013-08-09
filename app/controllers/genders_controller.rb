class GendersController < ApplicationController
	before_filter :authenticate_user!

	def new
		@gender = Gender.new
	end

	def create
		@gender = Gender.new params[:gender]
		if @gender.save
			redirect_to genders_path
		else
			return 'new'
		end
	end

	def show
		@gender = Gender.find params[:id]
		@games = Game.where gender_id: params[:id]
	end

	def index
		@genders = Gender.all
	end
	
end
