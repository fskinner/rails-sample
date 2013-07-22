class GameSample < ActiveRecord::Base
  belongs_to :devolution
  belongs_to :game
  has_many :rents

  before_save :generate_identifier

	def generate_identifier
		self.identifier = Digest::MD5.hexdigest("#{self.game.id}#{DateTime.now}")
	end	
	def rent_credit user
		return false unless user.shopcredit
		if user.shopcredit >= self.game.price_range.price
			Rent.request_rent self, user, "credits"
			self.available = false
			if self.save
				user.shopcredit -= self.game.price_range.price.to_i
				user.save
			end
		else
			false
		end
	end	
	
	def rent_money user
		Rent.request_rent self, user, "money"
		self.available = false
		self.save
	end
end
