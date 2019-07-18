class SnowReportsController < ApplicationController

	def index
		@snow_reports = SnowReport.all
		render json: @snow_reports
	end
	def search
		@snow_reports = SnowReport.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
	end

	private

	def force_json
		request.format = :json
	end
end
