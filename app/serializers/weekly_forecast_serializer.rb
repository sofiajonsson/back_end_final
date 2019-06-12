class WeeklyForecastSerializer < ActiveModel::Serializer
  has_many :favorites
	has_many :users, through: :favorites

  attributes :id, :title, :today_icon, :tomorrow_icon, :day3_icon, :day4_icon, :day5_icon, :day6_icon, :day7_icon, :today_at_base, :today_on_mountain, :tomorrow_at_base, :tomorrow_on_mountain, :day3_at_base, :day3_on_mountain, :day4_at_base, :day4_on_mountain, :day5_at_base, :day5_on_mountain, :day6_at_base, :day6_on_mountain, :day7_at_base, :day7_on_mountain
end
