class CreateSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :series do |t|
      t.datetime :series_start_date
      t.datetime :series_end_date
      t.string :series_type
      t.string :series_title
      t.text :series_description
      t.text :series_credits
      t.text :series_short_description

      t.timestamps
    end
  end
end
