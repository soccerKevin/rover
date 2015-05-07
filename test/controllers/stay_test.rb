require 'test_helper'
require 'date'

class StayApiTest < ActionDispatch::IntegrationTest
	setup do
		host! 'api.rover.com'
		@weeks_ago = DateTime.now - 14
		@last_week = DateTime.now - 7
		@stay = Stay.create!(rating: 5, review: "Great Sitter! My Dogs seem happy!", start_date: @weeks_ago, end_date: @last_week)
	end

	test 'As a user, I want a list of all the stays so I can choose the best one' do
		get '/stays', {}, { 'Accept' => Mime::JSON }
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	end
end
