class Devolution < ActiveRecord::Base
	belongs_to :rent
	
	validates :date, :presence => true
end
