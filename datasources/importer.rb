#!/bin/env ruby

ENV['RAILS_ENV'] = "development"
require '../bampfaex/config/environment.rb'
require 'csv'

events = []
csv_path = 'film_screenings_cleaned.csv'
headers = CSV.foreach(csv_path).first
CSV.foreach(csv_path, headers: true) do |row|
  events << row.to_h
end
puts  events
# require Event
puts Event.columns.map(&:name)
