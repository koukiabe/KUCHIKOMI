class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :place_id
      t.string :formatted_address
      t.string :name
      t.string :photo_reference
      t.string :weekday_text

      t.timestamps
    end
  end
end
