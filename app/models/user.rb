class User < ActiveRecord::Base
	has_many :rents
	has_many :histories
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :city, :street, :zipcode, :state, :email, :password, 
  		:password_confirmation, :remember_me, :shopcredit, :role

	validates :name, :presence => true
	validates :email, :presence => true, :uniqueness => true
	validates :street, :presence => true
	validates :city, :presence => true
	validates :state, :presence => true
	validates :zipcode, :presence => true

end