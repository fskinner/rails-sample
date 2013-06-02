class History < ActiveRecord::Base
  belongs_to :rent
  belongs_to :user

	validates :transaction_type, :presence => true
	validates :value, :presence => true
	validates :message, :presence => true

	def self.retrieve_credits user, value
		shopcredit = user.shopcredit - value
		if shopcredit >= 0
			user.shopcredit = shopcredit
			user.save
			return user
		end
		return false
	end

end
