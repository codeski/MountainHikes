class CreateHikes < ActiveRecord::Migration[6.1]
  def change
    create_table :hikes do |t|
      t.string :user_id
      t.string :mountain_id
      t.string :rating
      t.string :comment
      t.string :date
      t.string :percent_hiked
      t.string :hiked

      t.timestamps
    end
  end
end
