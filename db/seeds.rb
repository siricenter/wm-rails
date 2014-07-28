# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Building.create!({name: 'Windsor Manor Men\'s', capacity: 206})
Building.create!({name: 'Windsor Manor Women\'s', capacity: 344})

# Winter 2015
winter = Semester.new({name: "Winter 2015", rent: 1200, deposit: 50, duration: 1})
winter_duration = ContractDuration.new({start_date: Date.new(2015, 1, 2), end_date: Date.new(2015, 4, 10), payment_due: Date.new(2014, 12, 15), semester: winter})
winter.contract_durations << winter_duration
winter.save!

# Winter/Spring 2015
winter_spring = Semester.new({name: "Winter/Spring 2015", rent: 1200, deposit: 50, duration: 2})
winter_duration = ContractDuration.new({start_date: Date.new(2015, 1, 2), end_date: Date.new(2015, 4, 10), payment_due: Date.new(2014, 12, 15), semester: winter_spring})
spring_duration = ContractDuration.new({start_date: Date.new(2015, 4, 17), end_date: Date.new(2015, 7, 23), payment_due: Date.new(2015, 4, 1), semester: winter_spring})
winter_spring.contract_durations << winter_duration
winter_spring.contract_durations << spring_duration
winter_spring.save!
