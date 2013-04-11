class PriceIncrement < ActiveRecord::Base
	validates :value, :presence => true
end
