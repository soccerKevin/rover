class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_action :assert_api

  def assert_api
  	unless request.url.to_s.include? 'api'
			redirect_to subdomain: 'api' and return
		end
  end
end
