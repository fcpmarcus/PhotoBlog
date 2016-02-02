class User < ActiveRecord::Base
	
	validates_presence_of :name, :email, :password
	validates :name, length: { maximum: 40 }
end