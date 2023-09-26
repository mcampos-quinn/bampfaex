class AddUniqueComboToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :unique_combo, :string
  end
end
