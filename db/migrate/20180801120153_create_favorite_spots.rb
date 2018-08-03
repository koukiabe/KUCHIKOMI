class CreateFavoriteSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_spots do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true

      t.timestamps
      t.index [:user_id, :spot_id , :type], unique: true
    end
  end
end
