class AddUniqueShowtimeIndexToEvents < ActiveRecord::Migration[5.2]
  def change
    add_index :events, [:date, :datetime_one, :screening_title], unique: true
  end
end
