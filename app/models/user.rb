class User < ActiveRecord::
	validates :username, presence: true, length: {minimum: 3, maximum: 25} # provjerava da li je username i duzina teksta validna
	
end