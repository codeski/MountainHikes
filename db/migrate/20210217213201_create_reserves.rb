class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.integer :mountain_id
      t.integer :user_id

      t.timestamps
    end
  end
end
