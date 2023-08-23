class AddArtistlistToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :artist_list, :string
  end
end
