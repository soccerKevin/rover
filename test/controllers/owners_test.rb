require 'test_helper'

class OwnerApiTest < ActionDispatch::IntegrationTest
	setup do
		host! 'api.rover.com'
		@weeks_ago = DateTime.now - 14
		@last_week = DateTime.now - 7
		@sitter = create_sitter
		@owner = create_owner
		@stay = create_stay(@sitter, @owner, @weeks_ago, @last_week)
		@stay2 = create_stay(@sitter, @owner, @weeks_ago - 14, @last_week - 14)
	end

	test 'As a user, I want a list of all the owners so I can choose the best one' do
		get '/owners', {}, { 'Accept' => Mime::JSON }
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	end

	test 'As a user, I want to get 1 owner, so I can take a better look at him/her' do
		get "/owners/#{@owner.id}", {}, { 'Accept' => Mime::JSON }

		owner = json response.body
		assert_equal @owner.name, owner[:name]
		assert_equal @owner.stays.first.start_date, @stay.start_date
		assert_equal @owner.stays.last.start_date, @stay2.start_date
	end
end
