class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :weekly_forecast
	belongs_to :resort
	belongs_to :snow_report
end
