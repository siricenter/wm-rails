# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Building.create!({name: 'Windsor Manor Men\'s', capacity: 206})
Building.create!({name: 'Windsor Manor Women\'s', capacity: 344})
#
## Winter 2015
winter = Semester.new({name: "Winter 2015", rent: 1445, deposit: 50, duration: 1})
winter_duration = ContractDuration.new({start_date: Date.new(2015, 1, 2), end_date: Date.new(2015, 4, 11), payment_due: Date.new(2014, 12, 15), semester: winter})
#winter.contract_durations << winter_duration
winter.save!
#
## Winter/Spring 2015
#winter_spring = Semester.new({name: "Winter 2015 / Spring 2015", rent: 1445, deposit: 50, duration: 2})
#winter_duration = ContractDuration.new({start_date: Date.new(2015, 1, 2), end_date: Date.new(2015, 4, 11), payment_due: Date.new(2014, 12, 15), semester: winter_spring})
#spring_duration = ContractDuration.new({start_date: Date.new(2015, 4, 17), end_date: Date.new(2015, 7, 24), payment_due: Date.new(2015, 4, 1), semester: winter_spring})
#winter_spring.contract_durations << winter_duration
#winter_spring.contract_durations << spring_duration
#winter_spring.save!
#
## Winter/Spring/Fall 2015
#winter_spring_fall = Semester.new({name: "Winter 2015 / Spring 2015/ Fall 2015", rent: 1445, deposit: 50, duration: 3})
#winter_duration = ContractDuration.new({start_date: Date.new(2015, 1, 2), end_date: Date.new(2015, 4, 11), payment_due: Date.new(2014, 12, 15), semester: winter_spring_fall})
#spring_duration = ContractDuration.new({start_date: Date.new(2015, 4, 17), end_date: Date.new(2015, 7, 24), payment_due: Date.new(2015, 4, 1), semester: winter_spring_fall})
#fall_duration = ContractDuration.new({start_date: Date.new(2015, 9, 11), end_date: Date.new(2015, 12, 19), payment_due: Date.new(2015, 8, 24), semester: winter_spring_fall})
#winter_spring_fall.contract_durations << winter_duration
#winter_spring_fall.contract_durations << spring_duration
#winter_spring_fall.contract_durations << fall_duration
#winter_spring_fall.save!

## Spring 2015
spring = Semester.new({name: "Spring 2015", rent: 1445, deposit: 50, duration: 1})
spring_duration = ContractDuration.new({start_date: Date.new(2015, 4, 17), end_date: Date.new(2015, 7, 24), payment_due: Date.new(2015, 4, 1), semester: spring})
#spring.contract_durations << spring_duration
spring.save!

#
#spring_fall = Semester.new({name: "Spring 2015 / Fall 2015", rent: 1445, deposit: 50, duration: 2})
#spring_duration = ContractDuration.new({start_date: Date.new(2015, 4, 17), end_date: Date.new(2015, 7, 24), payment_due: Date.new(2015, 4, 1), semester: spring_fall})
#fall_duration = ContractDuration.new({start_date: Date.new(2015, 9, 11), end_date: Date.new(2015, 12, 19), payment_due: Date.new(2015, 8, 24), semester: spring_fall})
#spring_fall.contract_durations << spring_duration
#spring_fall.contract_durations << fall_duration
#spring_fall.save!
#
#spring_fall_winter = Semester.new({name: "Spring 2015 / Fall 2015 / Winter 2015", rent: 1445, deposit: 50, duration: 3})
#spring_duration = ContractDuration.new({start_date: Date.new(2015, 4, 17), end_date: Date.new(2015, 7, 24), payment_due: Date.new(2015, 4, 1), semester: spring_fall_winter})
#fall_duration = ContractDuration.new({start_date: Date.new(2015, 9, 11), end_date: Date.new(2015, 12, 19), payment_due: Date.new(2015, 8, 24), semester: spring_fall_winter})
#winter_duration = ContractDuration.new({start_date: Date.new(2016, 1, 2), end_date: Date.new(2016, 4, 9), payment_due: Date.new(2014, 12, 15), semester: spring_fall_winter})
#
#spring_fall_winter.contract_durations << winter_duration
#spring_fall_winter.contract_durations << spring_duration
#spring_fall_winter.contract_durations << fall_duration
#spring_fall_winter.save!


## Summer 2015
summer = Semester.new({name: "Summer 2015", rent: 300, deposit: 50, duration: 1})
summer_duration = ContractDuration.new({start_date: Date.new(2015, 7, 25), end_date: Date.new(2015, 9, 1), payment_due: Date.new(2015, 7, 24), semester: summer})
#summer.contract_durations << summer_duration
summer.save!

## Fall 2015
fall = Semester.new({name: "Fall 2015", rent: 1445, deposit: 50, duration: 1})
fall_duration = ContractDuration.new({start_date: Date.new(2015, 9, 2), end_date: Date.new(2015, 12, 31), payment_due: Date.new(2015, 9, 2), semester: fall})
#fall.contract_durations << summer_duration
fall.save!

Admin.create({email: 'managers@windsormanor.net', password: 'Greatestplace1'})
