class AddAltTitleToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :alt_title, :string
  end
end
