class WeeklyForecastsController < ApplicationController
	def index
		@weekly_forecasts = WeeklyForecast.all
		render json: @weekly_forecasts
	end
	def search
		@weekly_forecasts = WeeklyForecast.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
	end

	private

	def force_json
		request.format = :json
	end
end
