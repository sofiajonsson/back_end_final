class CreateResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.string :title
      t.string :img
      t.string :elevation_gain
      t.string :skiiable_terrain
      t.string :beginner
      t.string :intermediate
      t.string :expert
      t.string :total_lifts
      t.string :ticket_price

      t.timestamps
    end
  end
end
