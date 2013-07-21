class Game < ActiveRecord::Base
	belongs_to :console
	belongs_to :gender
	belongs_to :price_range
	has_many :game_samples
	
	validates :name, :presence => true

end