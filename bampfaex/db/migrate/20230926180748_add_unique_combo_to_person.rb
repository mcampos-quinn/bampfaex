class AddUniqueComboToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :unique_combo, :string
  end
end
