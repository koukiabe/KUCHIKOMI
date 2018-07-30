class CreateSpotWeekdays < ActiveRecord::Migration[5.0]
  def change
    create_table :spot_weekdays do |t|
      t.references :spot, foreign_key: true
      t.text :weekday_text

      t.timestamps
    end
  end
end
