class CreateSpotPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :spot_photos do |t|
      t.references :spot, foreign_key: true
      t.string :photo_url

      t.timestamps
    end
  end
end
