class AddImportRowIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :import_row_id, :string
  end
end
