class AddFilmRuntimeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :film_runtime, :string
  end
end
