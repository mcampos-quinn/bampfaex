class AddNameNoteToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :name_note, :string
  end
end
