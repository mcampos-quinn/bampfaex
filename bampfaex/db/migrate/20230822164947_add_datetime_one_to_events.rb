class AddDatetimeOneToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :datetime_one, :datetime
  end
end
