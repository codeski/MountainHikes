class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :hikes_completed
      t.string :hikes_incomplete
      t.string :total_elevation
      t.string :total_distance
      t.string :admin
      t.string :password_digest
      t.string :uid
      t.string :provider
      t.string :email

      t.timestamps
    end
  end
end
