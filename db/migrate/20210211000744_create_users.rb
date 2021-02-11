class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :total_elevation, default = 0
      t.float :total_distance, default = 0
      t.boolean :admin, default = false
      t.string :password_digest
      t.string :uid
      t.string :provider
      t.string :email

      t.timestamps
    end
  end
end
