class Rent < ActiveRecord::Base
	belongs_to :game
	belongs_to :user
	has_many :payments
	has_one :devolution
	has_one :deliverer
	has_one :history

	validates :initial_value, :presence => true
	validates :date, :presence => true

	def self.rent_game game, user
		rent = Rent.create date: DateTime.now, initial_value: game.price_range.price, game_id: game.id, user_id: user.id
		Deliverer.create date: DateTime.now + 1.day, rent_id: rent.id
		History.create value: game.price_range.price, transaction_type: "Debt", message: "aluguel", rent_id: rent.id, user_id: user.id
		rent
	end

	def return_game user
		Devolution.create date: DateTime.now, rent_id: self.id
		self.game.available = true
		self.game.save
		days = Rent.calculate_rent_duration(self.date, DateTime.now)
		value = Rent.return_exchange(days, self.game.price_range)
		History.create value: value, transaction_type: "Credit", message: "devolucao", rent_id: self.id, user_id: user.id
		user.shopcredit += value.to_i
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