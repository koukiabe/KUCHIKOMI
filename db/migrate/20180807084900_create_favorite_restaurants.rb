class CreateFavoriteRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_restaurants do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
      t.index [:user_id, :restaurant_id , :type], name: :favorite_restaurants_fk, unique: true
    end
  end
end
