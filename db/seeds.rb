# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/jta_free_wifi.csv') do |row|
    Spot.create(:janame => row[1], :enname => row[2], :zipcode => row[6],  :jaaddress => row[8], :enaddress => row[9], :latitude => row[18], :longitude => row[19])
end

