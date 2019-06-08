class SnowReportsController < ApplicationController

	def index
		@snow_reports = SnowReport.all
		render json: @snow_reports
	end

end
