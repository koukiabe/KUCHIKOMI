class AddWeekdayTextToSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :weekday_text, :text
  end
end
