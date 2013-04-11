class Rent < ActiveRecord::Base
	validates :value, :presence => true
	validates :date, :presence => true
end
