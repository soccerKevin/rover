require 'test_helper'

class SitterApiTest < ActionDispatch::IntegrationTest
	setup do
		host! 'api.rover.com'
		@sitter = Sitter.create!(name: 'First Sitter', rank: 5)
	end

	test 'As a user, I want a list of all the sitters so I can choose the best one' do
		get '/sitters', {}, { 'Accept' => Mime::JSON }
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	end
end
