class RemoveRestaurantFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :restaurant, foreign_key: true
  end
end
