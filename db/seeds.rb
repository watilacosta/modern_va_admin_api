# frozen_string_literal: true

# ##################################################
# ######### CREATE AIRPORTS FROM CSV FILE ########
# ##################################################
require 'csv'

p 'Creating airports...'
file = File.open('db/airports.csv')
new_airports = []

CSV.foreach(file, headers: true) do |row|
  next if row[0].nil? || row[1].nil? || row[2].nil? || row[3].nil?

  new_airports << {
    icao: row[0],
    name: row[1],
    latitude: row[2],
    longitude: row[3]
  }
end

begin
  Airport.insert_all(new_airports) unless new_airports.empty?
  p "Created #{new_airports.size} airports"
rescue => e
  p "Error creating airports: #{e.message}"
end
# ##################################################
# ######### END CREATE AIRPORTS ########
# ##################################################