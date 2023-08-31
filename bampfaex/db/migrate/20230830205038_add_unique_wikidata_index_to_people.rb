class AddUniqueWikidataIndexToPeople < ActiveRecord::Migration[5.2]
  def change
    add_index :people, [:fname, :lname, :wikidata_id], unique: true
  end
end
