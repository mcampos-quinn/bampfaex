class AddImportRowIdToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :import_row_id, :string
  end
end
