class AddPersonToRelations < ActiveRecord::Migration[5.2]
  def change
    add_reference :relations, :person
  end
end
