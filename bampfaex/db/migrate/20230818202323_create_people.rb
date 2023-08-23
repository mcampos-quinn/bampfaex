class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :fname
      t.string :lname
      t.string :etc_name
      t.string :display_name
      t.string :birth_date
      t.string :death_date

      t.timestamps
    end
  end
end
