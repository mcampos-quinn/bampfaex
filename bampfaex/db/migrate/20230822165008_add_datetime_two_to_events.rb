class AddDatetimeTwoToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :datetime_two, :datetime
  end
end
