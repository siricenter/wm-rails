# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Building.create!({name: 'Windsor Manor Men\'s', capacity: 206})
Building.create!({name: 'Windsor Manor Women\'s', capacity: 344})

winter = Semester.new({name: "Winter 2015", rent: 1200, deposit: 50, duration: 1})
winter.contract_durations << ContractDuration.create({start_date: Date.new(2015, 1, 2), end_date: Date.new(2015, 4, 2), semester: winter})
winter.save!

winter_spring = Semester.new({name: "Winter/Spring 2015", rent: 1200, deposit: 50, duration: 2})
winter_spring.contract_durations << ContractDuration.create({start_date: Date.new(2015, 1, 2), end_date: Date.new(2015, 4, 2), semester: winter_spring})
winter_spring.save!

Admin.create!(email: 'CJPoll@gmail.com', password: 'ki876Lp#$')
