class Devolution < ActiveRecord::Base
	belongs_to :rent

	def confirm_return
		self.date = DateTime.now
		self.save
		self.rent.game.available = true
		self.rent.game.save
	end
end
