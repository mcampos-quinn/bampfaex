require 'csv'

items = []
CSV.foreach('link/to/file.csv', headers: true) do |row|
  items << row.to_h
end
Item.import(items)
