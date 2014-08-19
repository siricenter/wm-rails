# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Building.create!({name: 'Windsor Manor Men\'s', capacity: 206})
Building.create!({name: 'Windsor Manor Women\'s', capacity: 344})

Semester.create!({name: 'Winter 2015', deposit: 50, rent: 1445, start_date: Date.new(2015, 1, 1), end_date: Date.new(2015, 4, 12)})
Semester.create!({name: 'Spring 2015', deposit: 50, rent: 1445, start_date: Date.new(2015, 4, 15), end_date: Date.new(2015, 7, 21)})
Semester.create!({name: 'Fall 2015', deposit: 50, rent: 1500, start_date: Date.new(2015, 9, 10), end_date: Date.new(2015, 12, 13)})
Semester.create!({name: 'Winter 2016', deposit: 50, rent: 1500, start_date: Date.new(2016, 1, 1), end_date: Date.new(2015, 1, 31)})
Semester.create!({name: 'Spring 2016', deposit: 50, rent: 1445, start_date: Date.new(2016, 4, 15), end_date: Date.new(2016, 7, 21)})
Semester.create!({name: 'Fall 2016', deposit: 50, rent: 1500, start_date: Date.new(2016, 9, 10), end_date: Date.new(2016, 12, 13)})

Admin.create({email: 'managers@windsormanor.net', password: 'Greatestplace1'})
