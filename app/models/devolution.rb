class Devolution < ActiveRecord::Base
	validates :date, :presence => true
	validates :midia_status, :presence => true
end
