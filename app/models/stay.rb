class Stay < ActiveRecord::Base
	belongs_to :sitter
	belongs_to :owner
end
