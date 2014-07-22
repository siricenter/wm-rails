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

Semester.create!({name: "Winter 2015", start_date: Date.new(2015, 1, 2), end_date: Date.new(2015, 4, 10), private_cost: 1500, shared_cost: 1200, deposit: 250})

Admin.create!(email: 'CJPoll@gmail.com', password: 'ki876Lp#$')
