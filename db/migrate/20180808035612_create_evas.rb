class CreateEvas < ActiveRecord::Migration[5.0]
  def change
    create_table :evas do |t|
      t.references :user, foreign_key: true
      t.references :res_review, foreign_key: true

      t.timestamps
      t.index [:user_id, :res_review_id], unique: true
    end
  end
end
