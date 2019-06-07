class WeeklyForecastsController < ApplicationController
	def index
		@weekly_forecasts = WeeklyForecast.all
	end
end
