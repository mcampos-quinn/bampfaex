class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :date
      t.datetime :showtimes
      t.string :screening_title
      t.text :description
      t.text :legacy_credit_text
      t.string :location

      t.timestamps
    end
  end
end
