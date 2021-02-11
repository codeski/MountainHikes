class CreateMountains < ActiveRecord::Migration[6.1]
  def change
    create_table :mountains do |t|
      t.integer :base_elevation, default = 0
      t.integer :summit_elevation, default = 0
      t.string :name
      t.string :city
      t.string :state
      t.string :directions_url
      t.string :hike_distance, default = 0

      t.timestamps
    end
  end
end
