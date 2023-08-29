class ChangeWorkYearToString < ActiveRecord::Migration[5.2]
  def change
    change_column :works, :year, :string
  end
end
