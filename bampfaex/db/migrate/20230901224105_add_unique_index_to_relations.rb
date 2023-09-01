class AddUniqueIndexToRelations < ActiveRecord::Migration[5.2]
  def change
    add_index :relations, [:series_id, :person_id], unique: true
    add_index :relations, [:series_id, :event_id], unique: true
    add_index :relations, [:event_id, :person_id], unique: true
    add_index :relations, [:event_id, :work_id], unique: true
    add_index :relations, [:work_id, :person_id], unique: true
  end
end
