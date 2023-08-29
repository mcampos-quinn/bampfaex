class AddTitleToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :title, :string
    add_column :works, :country, :string
  end
end
