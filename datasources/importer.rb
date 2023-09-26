#!/bin/env ruby

ENV['RAILS_ENV'] = "development"
require '../bampfaex/config/environment.rb'
require 'csv'

def import_csv(path:,model:)
  items = []
  CSV.foreach(path, headers: true) do |row|
    item = row.to_h.compact
    # puts item
    unless item.empty? ||
      # this makes a new item just for the sake of accessing
      # the make_unique_combo method
      new_item = model.new(item)
      unique_combo = new_item.make_unique_combo
      # puts unique_combo
      preexisting = model.select("*").where("unique_combo LIKE ?",unique_combo)
      # puts preexisting
      if preexisting[0].nil?
        item['unique_combo'] = unique_combo
        # puts item
        model.create(item)
      else
        # puts item
        preexisting[0].update(import_row_id: "#{preexisting[0].import_row_id}#{item['import_row_id']}")
        preexisting[0].save
      end
    end
    # items << row.to_h
    # items = items.compact
  end
  # model.import(items.compact, on_duplicate_key_ignore: true)
end

path = ARGV[0]
model = ARGV[1].constantize

import_csv(path: path, model: model)
