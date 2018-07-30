class ChangeDatatypeWeekdayTextOfSpots < ActiveRecord::Migration[5.0]
  def change
    change_column :spots, :weekday_text, :string
  end
end
