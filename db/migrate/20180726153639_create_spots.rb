class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :place_id
      t.string :formatted_address
      t.string :name
      t.string :photo_reference

      t.timestamps
    end
  end
end
