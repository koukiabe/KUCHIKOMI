class CreateResReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :res_reviews do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.string :image
      t.string :title
      t.text :review

      t.timestamps
    end
  end
end
