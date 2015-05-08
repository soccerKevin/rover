class API::StaysController < ApplicationController
	def index
		@stays = Stay.includes(:sitter, :owner)
		render json: @stays.as_json(include: [:sitter, :owner]), status: :ok
	end

	def show
		@stay = Stay.includes(:sitter).find(params[:id])
		render json: @stay.as_json(include: [:sitter]), status: :ok
	end
end
