require 'test_helper'

class SitterTest < ActiveSupport::TestCase
	setup do
		do_setup
	end

	test 'As a user, I want a sitter to have a sitter score, so I can to weigh them' do
		assert_equal 5 * 6 / 26, @sitter.score
	end

	test 'As a user, I want to know a sitters rating, so I can weigh them better' do
		assert_equal 5, @sitter.rating
	end

	test 'As a user, I want to know a sitters rank, so I choose the best ones' do
		assert_equal 5 * 6 / 26 * (10 - 2) + 5 * (2 / 10), @sitter.rank
	end
end
