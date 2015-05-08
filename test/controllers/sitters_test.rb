require 'test_helper'

class SitterApiTest < ActionDispatch::IntegrationTest
	setup do
		do_setup true
	end

	test 'As a user, I want a list of all the sitters so I can choose the best one' do
		get '/sitters', {}, { 'Accept' => Mime::JSON }
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	end

	test 'As a user, I want to get 1 sitter, so I can take a better look at him/her' do
		get "/sitters/#{@sitter.id}", {}, { 'Accept' => Mime::JSON }

		sitter = json response.body
		assert_equal @sitter.name, sitter[:name]
		assert_equal @sitter.stays.first.start_date, @stay.start_date
		assert_equal @sitter.stays.last.start_date, @stay2.start_date
	end
end
