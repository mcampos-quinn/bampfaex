class AddUniqueComboToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :unique_combo, :string
  end
end
