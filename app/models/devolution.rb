class Devolution < ActiveRecord::Base
	belongs_to :rent

	def confirm_return
		self.date = DateTime.now
		self.save
		self.rent.game_sample.available = true
		self.rent.game_sample.save
	end
end
