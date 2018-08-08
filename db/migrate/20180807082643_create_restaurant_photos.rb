class CreateRestaurantPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_photos do |t|
      t.references :restaurant, foreign_key: true
      t.string :photo_url

      t.timestamps
    end
  end
end
