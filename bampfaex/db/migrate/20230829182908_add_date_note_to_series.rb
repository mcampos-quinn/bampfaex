class AddDateNoteToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :date_note, :string
  end
end
