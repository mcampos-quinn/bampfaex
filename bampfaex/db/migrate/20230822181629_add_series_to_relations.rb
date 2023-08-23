class AddSeriesToRelations < ActiveRecord::Migration[5.2]
  def change
    add_reference :relations, :series
  end
end
