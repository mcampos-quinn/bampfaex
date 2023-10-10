#!/bin/env ruby

# ruby linker.rb /path/to/csv SourceModel DestinationModel "relationship"
# ruby linker.rb /artists/to/link/to/exhibitions.csv Series Person artist
# the csv looks like this

# import_row_id	  |display_name         | fname	      | lname
# ser_00078	      |Anna Maria Maiolino	| Anna Maria	|  Maiolino

# relationship is "artist" "director" "cinematographer" "curator" etc.

ENV['RAILS_ENV'] = "development"
require '../bampfaex/config/environment.rb'
require 'csv'

def link_csv(path:, model_source: ,model_dest:, relationship:)
  # items = []
  # headers = CSV.foreach(path).first
  CSV.foreach(path, headers: true) do |row|
    item = row.to_h.compact
    source_import_row_id = item['import_row_id']
    # puts item

    unless item.empty?
      source_id_label = model_source.name.downcase + "_id"
      source_id = model_source.where(item.except!('import_row_id')).ids[0]
      puts source_id_label
      puts source_id
      # source = model_source.find(source_id)
      # puts source.display_name

      destination_id_label = model_dest.name.downcase + "_id"
      # item.except! returns the csv row hash without the import_row_id
      # and it's just fed as a hash to the db query. neat!
      destination_id = model_dest.where("import_row_id LIKE '%#{source_import_row_id}%'").ids[0]
      # puts destination_id_label
      # puts destination_id

      unless source_id.blank? or destination_id.blank?
        values = { :relation_value => relationship, source_id_label => source_id, destination_id_label => destination_id}
        puts values
        begin
          p = Relation.create!(values)
          puts p.valid?
        rescue
          puts "invalid relation between #{source_id_label}:#{source_id} and #{destination_id_label}:#{destination_id}"
        end
      end
    end
  end
end

path = ARGV[0]
model_source = ARGV[1].constantize
model_dest = ARGV[2].constantize
relationship = ARGV[3]

if [path,model_source,model_dest,relationship].all?
  link_csv(path: path, model_source: model_source,model_dest: model_dest, relationship: relationship)
end
