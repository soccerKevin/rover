class API::SittersController < ApplicationController
	def index
		sitters = Sitter.includes(:stays)
		render json: sitters.as_json(include: :stays), status: :ok
	end
end
