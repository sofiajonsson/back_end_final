class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :weekly_forecast_id
      t.integer :snow_report_id
      t.integer :resort_id

      t.timestamps
    end
  end
end
