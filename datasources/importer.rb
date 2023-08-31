#!/bin/env ruby

ENV['RAILS_ENV'] = "development"
require '../bampfaex/config/environment.rb'
require 'csv'

def import_csv(path:,model:)
  items = []
  CSV.foreach(path, headers: true) do |row|
    item = row.to_h.compact
    puts item
    unless item.empty?
      model.create(item)
    end
    # items << row.to_h
    # items = items.compact
  end
  # model.import(items.compact, on_duplicate_key_ignore: true)
end

path = ARGV[0]
model = ARGV[1].constantize

import_csv(path: path, model: model)
