class CreateWeeklyForecasts < ActiveRecord::Migration[5.2]
  def change
      create_table :weekly_forecasts do |t|
      t.string :title
      t.string :today_at_base
      t.string :today_on_mountain
      t.string :tomorrow_at_base
      t.string :tomorrow_on_mountain
      t.string :day3_at_base
      t.string :day3_on_mountain
      t.string :day4_at_base
      t.string :day4_on_mountain
      t.string :day5_at_base
      t.string :day5_on_mountain
      t.string :day6_at_base
      t.string :day6_on_mountain
      t.string :day7_at_base
      t.string :day7_on_mountain
    end
  end
end
