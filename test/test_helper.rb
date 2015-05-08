ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def do_setup(has_host = false)
    host! 'api.rover.com' if has_host
    @weeks_ago = DateTime.now - 14
    @last_week = DateTime.now - 7
    @sitter = create_sitter
    @owner = create_owner
    @stay = create_stay(@sitter, @owner, @weeks_ago, @last_week)
    @stay2 = create_stay(@sitter, @owner, @weeks_ago - 14, @last_week - 14)
  end

  def create_sitter
  	Sitter.create!(name: 'First Sitter')
  end

  def create_owner
    Owner.create!(name: 'First Owner', dogs: "Rickert|Daisy|Spot")
  end

  def create_stay(sitter, owner, start_date, end_date)
  	Stay.create!(
							rating: 5,
							review: "Great Sitter! My Dogs seem happy!",
							start_date: start_date,
							end_date: end_date,
							sitter_id: sitter.id,
              owner_id: owner.id
						)
  end

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end
