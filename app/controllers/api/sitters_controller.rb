class API::SittersController < ApplicationController
	def index
		sitters = Sitter.all
		render json: sitters.as_json, status: :ok
	end
end
