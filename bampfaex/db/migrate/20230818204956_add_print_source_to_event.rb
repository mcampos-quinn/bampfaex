class AddPrintSourceToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :print_source, :string
  end
end
