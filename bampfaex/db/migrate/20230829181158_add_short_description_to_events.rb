class AddShortDescriptionToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :short_description, :string
  end
end
