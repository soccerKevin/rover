class API::OwnersController < ApplicationController
	def index
		@owners = Owner.includes(:stays)
		render json: @owners.as_json(include: :stays), status: :ok
	end

	def show
		@owners = Owner.includes(:stays).find(params[:id])
		render json: @owners.as_json(include: :stays), status: :ok
	end
end
