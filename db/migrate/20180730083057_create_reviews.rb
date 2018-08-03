class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true
      t.string :image
      t.string :title
      t.string :review

      t.timestamps
    end
  end
end
