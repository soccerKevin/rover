class Owner < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :stays
end
