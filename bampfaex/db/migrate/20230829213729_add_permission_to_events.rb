class AddPermissionToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :permission, :string
  end
end
