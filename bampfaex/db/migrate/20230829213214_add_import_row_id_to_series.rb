class AddImportRowIdToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :import_row_id, :string
  end
end
