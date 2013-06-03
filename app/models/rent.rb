class Rent < ActiveRecord::Base
	belongs_to :game
	belongs_to :user
	has_many :payments
	has_one :devolution
	has_one :deliverer
	has_one :history

	validates :initial_value, :presence => true

	def self.request_rent game, user, currency
		rent = Rent.create initial_value: game.price_range.price, game_id: game.id, user_id: user.id
		History.create value: game.price_range.price, transaction_type: "Debt", message: "aluguel", currency: currency, rent_id: rent.id, user_id: user.id
		rent
	end

	def accept_rent
		Deliverer.create date: DateTime.now, rent_id: self.id
		self.date = DateTime.now
		self.save
		self
	end

	def request_return user
		Devolution.create rent_id: self.id
		days = Rent.calculate_rent_duration self.date, DateTime.now
		value = Rent.return_exchange days, self.game.price_range
		History.create value: value, transaction_type: "Credit", message: "devolucao", currency: "credits", rent_id: self.id, user_id: user.id
		user.shopcredit = user.shopcredit + value.to_i
		user.save
		self
	end

	def self.return_exchange day_count, price_range
		increment = price_range.increment_value
		game_price = price_range.price

		value_to_pay = day_count * increment
		exchange_value = game_price - value_to_pay

		if exchange_value < 0
			exchange_value = 0
		end

		exchange_value
		
	end

	def self.calculate_rent_duration start_date, end_date
		days = ((end_date.to_i - start_date.to_i) / 3600 / 24) + 1

		if days < 0
			days = 0
		end
		
		days
	end

end