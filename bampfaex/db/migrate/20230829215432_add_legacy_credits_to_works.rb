class AddLegacyCreditsToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :legacy_credits, :text
  end
end
