class AddColumnsToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :exhibition_number, :string
    add_column :series, :catalog_notes, :string
    add_column :series, :brochure_notes, :string
    add_column :series, :tour_notes, :string
    add_column :series, :outside_organizer, :string
    add_column :series, :location, :string
  end
end
