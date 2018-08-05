class CreateRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :refs do |t|
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
      t.index [:user_id, :review_id], unique: true
    end
  end
end
