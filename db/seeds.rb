# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
mens = Building.create!({name: 'Windsor Manor Men\'s'})
womens = Building.create!({name: 'Windsor Manor Women\'s'})

Apartment.create!({building: mens, number: 101, bed_count: 6, floor: 1})
Apartment.create!({building: mens, number: 102, bed_count: 6, floor: 1})
Apartment.create!({building: womens, number: 101, bed_count: 6, floor: 1})
Apartment.create!({building: womens, number: 102, bed_count: 6, floor: 1})

Semester.create!({name: "Spring 2014", start_date: Date.yesterday, end_date: Date.tomorrow})

ParkingSpot.create!({number: 1})
