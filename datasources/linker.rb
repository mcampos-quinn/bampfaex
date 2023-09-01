#!/bin/env ruby

# ruby linker.rb /path/to/csv SourceModel (e.g. Work) DestinationModel (e.g. Event) "relationship" (e.g. "artist" "director" "cinematographer" "curator" etc)

## ACTUALLY I THINK THIS NEEDS TO BE THE REVERSE WHERE THE MOST LIKELY UNIQUE ITEM (THE SCREENING) IS THE SOURCE AND THE REPEATABLE ENTITY IS THE DESTINATION

ENV['RAILS_ENV'] = "development"
require '../bampfaex/config/environment.rb'
require 'csv'

def link_csv(path:, model_source: ,model_dest:, relationship:)
  items = []
  headers = CSV.foreach(path).first
  CSV.foreach(path, headers: true) do |row|
    item = row.to_h.compact
    source_import_row_id = item['import_row_id']
    puts item

    unless item.empty?
      # item.except! returns the csv row hash without the import_row_id
      # and it's just fed as a hash to the db query. neat!
      source_id = model_source.where(import_row_id:source_import_row_id).ids[0]
      source_id_label = model_source.name.downcase + "_id"
      puts source_id_label
      puts source_id
      destination_id = model_dest.where(item.except!('import_row_id')).ids[0]
      destination_id_label = model_dest.name.downcase + "_id"
      puts destination_id_label
      puts destination_id
      unless source_id.nil? or destination_id.nil?
        values = { :relation_value => relationship, source_id_label => source_id , destination_id_label => destination_id}
        puts values
        Relation.create(values)
      end
    end

  end
end

path = ARGV[0]
model_source = ARGV[1].constantize
model_dest = ARGV[2].constantize
relationship = ARGV[3]

link_csv(path: path, model_source: model_source,model_dest: model_dest, relationship: relationship)
