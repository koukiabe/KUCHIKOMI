class DropTableFavoriteSpots < ActiveRecord::Migration[5.0]
  def change
    drop_table :favorite_spots
  end
end
