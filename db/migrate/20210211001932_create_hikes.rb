class CreateHikes < ActiveRecord::Migration[6.1]
  def change
    create_table :hikes do |t|
      t.integer :user_id
      t.integer :mountain_id
      t.integer :rating, default: 0
      t.string :comment
      t.date :date_hiked
      t.integer :percent_hiked, default: 100
      t.float :total_distance, default: 0
      t.float :total_elevation_gain, default: 0

      t.timestamps
    end
  end
end
