require 'test_helper'
require 'date'

class StayApiTest < ActionDispatch::IntegrationTest
	setup do
		do_setup true
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
