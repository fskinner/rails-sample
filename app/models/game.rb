class Game < ActiveRecord::Base
	belongs_to :console
	belongs_to :gender
	belongs_to :price_range
	has_many :rents
	
	validates :name, :presence => true

	def rent_credit user
		if user.shopcredit >= self.price_range.price
			Rent.rent_game self, user
			self.available = false
			self.save
		else
			false
		end
	end

	def rent_money user
		Rent.rent_game self, user
		self.available = false
		self.save
	end

	def devolution status
		# Devolution.create date: DateTime.now, midia_status: status
		# self.rent.user.shopcredit.value = self.exchange
		# self.availability = true
		# self
	end

	def exchange
		# weeks = (self.devolution.date - self.rent.date).to_i / 1.week
		# if weeks > 0
		# 	value = weeks * self.price_range.price_increment.value
		# 	if value < self.price_range.price / 2
		# 		final_value = self.price_range.price / 2
		# 	else
		# 		final_value = self.price_range.price - value
		# 	end
		# else
		# 	final_value = self.price_range.price - self.price_range.price_increment.value
		# end
		# final_value
	end
end
