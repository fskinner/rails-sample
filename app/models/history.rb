class History < ActiveRecord::Base
  belongs_to :rent
  belongs_to :user

	validates :transaction_type, :presence => true
	validates :value, :presence => true
	validates :message, :presence => true

end
