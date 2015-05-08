class Sitter < ActiveRecord::Base
	validates :name, uniqueness: true

	has_many :stays

	def rank
		c = self.stays.count
		self.score * (10 - c) + self.rating * (c / 10)
	end

	def score
		unique_letters = self.name.chars.to_a.uniq.count
		5 * unique_letters / 26
	end

	def rating
		ratings = self.stays.map{|s| s.rating}
		sum = ratings.inject{|sum, r| sum + r}
		sum / ratings.count
	end
end
