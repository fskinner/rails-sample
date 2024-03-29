class GameSamplesController < ApplicationController
	before_filter :authenticate_user!

	def new
		@game_sample = GameSample.new
	end

	def edit
		@game_sample = GameSample.find params[:id]
	end

	def update
		@game_sample = GameSample.find params[:id]
		if @game_sample.update_attributes params[:game_sample]
			redirect_to game_samples_path
		else
			return 'edit'
		end
  	end

	def create
		@game_sample = GameSample.new params[:game_sample]
		@game_sample.available = true
		if @game_sample.save
			redirect_to game_samples_path
		else
			return 'new'
		end
	end

	def index
		@game_samples = GameSample.where available: true
	end

	def destroy
		@game_sample = GameSample.find params[:id]
		@game_sample.destroy
    	redirect_to game_samples_path
  	end

	def rent
		@game_sample = GameSample.find params[:id]
	end

	def rent_money
		@game_sample = GameSample.find params[:id]
		if @game_sample.rent_money current_user
			redirect_to root_url
		else
			render 'rent'
		end
	end

	def rent_credit
		@game_sample = GameSample.find params[:id]
		if @game_sample.rent_credit current_user
			redirect_to root_url
		else
			render 'rent'
		end
	end
	
end
