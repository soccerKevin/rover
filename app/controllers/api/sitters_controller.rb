class API::SittersController < ApplicationController
	def index
		@sitters = Sitter.includes(:stays)
		render json: @sitters.as_json(include: :stays, methods: :rank), status: :ok
	end

	def show
		@sitter = Sitter.includes(:stays).find(params[:id])
		render json: @sitter.as_json(include: :stays, methods: :rank), status: :ok
	end
end
