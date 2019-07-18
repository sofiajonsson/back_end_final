class ResortsController < ApplicationController
	  before_action :force_json, only: :search
	def index
		@resorts = Resort.all
		render json: @resorts
	end
	def search
		@resorts = Resort.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
	end

	private

	def force_json
		request.format = :json
	end

end
