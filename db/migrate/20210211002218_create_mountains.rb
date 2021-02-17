class CreateMountains < ActiveRecord::Migration[6.1]
  def change
    create_table :mountains do |t|
      t.integer :base_elevation
      t.integer :summit_elevation
      t.string :name
      t.string :city
      t.string :state
      t.string :directions_url
      t.integer :hike_distance
      t.boolean :saved, default: false

      t.timestamps
    end
  end
end
