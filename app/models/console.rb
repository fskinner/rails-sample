class Console < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
end
