class CreateSnowReports < ActiveRecord::Migration[5.2]
  def change
    create_table :snow_reports do |t|
      t.string :title
      t.string :elevation
      t.string :status
      t.string :depth
      t.string :slopes
      t.string :lifts
      t.string :link

      t.timestamps
    end
  end
end
