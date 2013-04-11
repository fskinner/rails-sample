class Deliverer < ActiveRecord::Base
	validates :date, :presence => true
end
