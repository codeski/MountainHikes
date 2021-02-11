class CreateMountains < ActiveRecord::Migration[6.1]
  def change
    create_table :mountains do |t|
      t.string :base_elevation
      t.string :summit_elevation
      t.string :name
      t.string :city
      t.string :state
      t.string :directions_url
      t.string :hike_distance

      t.timestamps
    end
  end
end
