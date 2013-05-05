class Deliverer < ActiveRecord::Base
	belongs_to :rent
	
	validates :date, :presence => true
end
