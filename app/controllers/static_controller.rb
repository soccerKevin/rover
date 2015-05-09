class StaticController < ApplicationController
	def index
		unless request.url.to_s.include? 'api'
			redirect_to subdomain: 'api' and return
		end

		render 'static/stays'
	end

	def stays
	end
end
