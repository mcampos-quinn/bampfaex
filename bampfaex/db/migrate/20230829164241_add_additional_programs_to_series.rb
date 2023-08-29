class AddAdditionalProgramsToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :additional_programs, :string
  end
end
