class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :followers
      t.string :following
      t.string :location
      t.string :image_url
      t.string :token

      t.timestamps null: false
    end
  end
end
