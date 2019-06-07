class SnowReportsController < ApplicationController
	def index
		@snow_reports = SnowReport.all
	end
end
