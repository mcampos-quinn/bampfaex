class AddWikidataIdToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :wikidata_id, :string
  end
end
