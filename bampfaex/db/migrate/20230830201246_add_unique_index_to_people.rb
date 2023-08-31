class AddUniqueIndexToPeople < ActiveRecord::Migration[5.2]
  def change
    add_index :people, [:fname, :lname, :name_note], unique: true
  end
end
