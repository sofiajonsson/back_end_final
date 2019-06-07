class CreateUserNames < ActiveRecord::Migration[5.2]
  def change
    create_table :user_names do |t|
      t.datetime :date_of_review
      t.integer :rating
      t.string :title
      t.string :description
      t.integer :age
      t.string :rider_type
      t.integer :user_id
      t.string :resort_id

      t.timestamps
    end
  end
end
