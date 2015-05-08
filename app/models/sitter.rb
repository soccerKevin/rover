class Sitter < ActiveRecord::Base
	validates :name, uniqueness: true

	has_many :stays
end
