require 'test_helper'
require 'date'

class StayApiTest < ActionDispatch::IntegrationTest
	setup do
		host! 'api.rover.com'
		@weeks_ago = DateTime.now - 14
		@last_week = DateTime.now - 7
		@sitter = create_sitter
		@stay = create_stay(@sitter, @weeks_ago, @last_week)
	end

	test 'As a user, I want a list of all the stays so I can choose the best one' do
		get '/stays', {}, { 'Accept' => Mime::JSON }
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	end

	test 'As a user, I want to get 1 stay so I can take a better look at it' do
		get "/stays/#{@stay.id}", {}, { 'Accept' => Mime::JSON }
		assert_equal 200, response.status

		stay = json response.body
		assert_equal @stay.rating, stay[:rating]
		assert_equal @sitter.id, stay[:sitter_id]
	end
end
