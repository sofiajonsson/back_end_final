class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.string :date_of_review
      t.integer :rating
      t.string :title
      t.text :description
      t.integer :age
      t.string :rider_type
      t.integer :user_id
      t.integer :resort_id

      t.timestamps
    end
  end
end
