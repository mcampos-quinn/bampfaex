class AddWorkToRelations < ActiveRecord::Migration[5.2]
  def change
    add_reference :relations, :work
  end
end
