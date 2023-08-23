class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.datetime :year
      t.text :description

      t.timestamps
    end
  end
end
