#!/bin/env ruby

ENV['RAILS_ENV'] = "development"
require '../bampfaex/config/environment.rb'
require 'csv'

def import_csv(path:, model_source: ,model_dest:)
  items = []
  CSV.foreach(path, headers: true) do |row|
    items << row.to_h
  end
  model.import(items)
end

path = ARGV[0]
model_source = ARGV[1].constantize
model_dest = ARGV[1].constantize

import_csv(path: path, model_source: model_source,model_dest: model_dest)
