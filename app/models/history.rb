class History < ActiveRecord::Base
  belongs_to :rent
  belongs_to :user

	validates :transaction_type, :presence => true
	validates :value, :presence => true
	validates :message, :presence => true
	validates :date, :presence => true

	def self.retrieve_credits user, value
		shopcredit = user.shopcredit - value
		if shopcredit >= 0
			user.shopcredit = shopcredit
			user.save
			History.create date: DateTime.now, value: value, transaction_type: "Debit", message: "resgate", currency: "credits", user_id: user.id
			History.create date: DateTime.now + 1.day, value: value, transaction_type: "Credit", message: "deposito", currency: "money", user_id: user.id
			return user
		end
		return false
	end

end
