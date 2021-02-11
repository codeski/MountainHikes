class CreateHikes < ActiveRecord::Migration[6.1]
  def change
    create_table :hikes do |t|
      t.integer :user_id
      t.integer :mountain_id
      t.integer :rating
      t.string :comment
      t.date :date_hiked
      t.integer :percent_hiked
      t.boolean :hiked, default = false

      t.timestamps
    end
  end
end
