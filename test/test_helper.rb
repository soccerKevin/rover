ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_sitter
  	Sitter.create!(name: 'First Sitter', rank: 5)
  end

  def create_stay(sitter, start_date, end_date)
  	Stay.create!(
							rating: 5,
							review: "Great Sitter! My Dogs seem happy!",
							start_date: start_date,
							end_date: end_date,
							sitter_id: sitter.id
						)
  end

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end
