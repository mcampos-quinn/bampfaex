#!/bin/env ruby

ENV['RAILS_ENV'] = "development"
require '../bampfaex/config/environment.rb'
require 'csv'

# events = []
# event_csv_path = 'film_screenings_cleaned.csv'
# headers = CSV.foreach(event_csv_path).first
# CSV.foreach(event_csv_path, headers: true) do |row|
#   events << row.to_h
# end
# # puts  events
# # require Event
# # puts Event.columns.map(&:name)
# Event.import(events)

def import_csv(path:,model:)
  items = []
  CSV.foreach(path, headers: true) do |row|
    items << row.to_h
  end
  model.import(items)
end

path = ARGV[0]
model = ARGV[1].constantize

import_csv(path: path, model: model)
