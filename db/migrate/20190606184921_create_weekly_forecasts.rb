class CreateWeeklyForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_forecasts do |t|
      t.string :title
      t.string :today
      t.string :tomorrow
      t.string :day3
      t.string :day4
      t.string :day5
      t.string :day6
      t.string :day7

      t.timestamps
    end
  end
end
