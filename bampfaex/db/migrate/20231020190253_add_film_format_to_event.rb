class AddFilmFormatToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :film_format, :string
  end
end
