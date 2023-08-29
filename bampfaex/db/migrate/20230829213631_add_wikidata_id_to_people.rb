class AddWikidataIdToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :wikidata_id, :string
  end
end
