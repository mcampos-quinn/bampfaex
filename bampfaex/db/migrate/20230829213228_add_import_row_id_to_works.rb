class AddImportRowIdToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :import_row_id, :string
  end
end
