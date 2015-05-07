class API::StaysController < ApplicationController
	def index
		stays = Stay.all
		render json: stays.as_json, status: :ok
	end
end
