class GendersController < ApplicationController
	before_filter :authenticate_user!

	def index
		@genders = Gender.all
	end
	
end
