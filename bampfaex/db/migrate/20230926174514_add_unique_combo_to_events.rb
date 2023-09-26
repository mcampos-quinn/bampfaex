class AddUniqueComboToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :unique_combo, :string
  end
end
