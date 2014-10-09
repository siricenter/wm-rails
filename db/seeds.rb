# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#  id                      :integer          not null, primary key
#  contract                :text
#  living_standards        :text
#  parking_acknowledgement :text
#  eligibility             :text
#  created_at              :datetime
#  updated_at              :datetime
#  addendum                :text

ContractText.create!({contract: "contract text", living_standards: "living_standards text", parking_acknowledgement: "parking_acknowledgement text" , eligibility: "eligibility text", addendum: "addendum text"})
Building.create!({name: 'Windsor Manor Women\'s', capacity: 344})
Building.create!({name: 'Windsor Manor Men\'s', capacity: 206})

sem1 = Semester.create!({name: 'Winter 2015', deposit: 50, rent: 1445, start_date: Date.new(2015, 1, 1), end_date: Date.new(2015, 4, 12)})
sem2 = Semester.create!({name: 'Spring 2015', deposit: 50, rent: 1445, start_date: Date.new(2015, 4, 15), end_date: Date.new(2015, 7, 21)})
Semester.create!({name: 'Fall 2015', deposit: 50, rent: 1445, start_date: Date.new(2015, 9, 10), end_date: Date.new(2015, 12, 13)})
Semester.create!({name: 'Winter 2016', deposit: 50, rent: 1445, start_date: Date.new(2016, 1, 1), end_date: Date.new(2016, 1, 31)})
Semester.create!({name: 'Spring 2016', deposit: 50, rent: 1445, start_date: Date.new(2016, 4, 15), end_date: Date.new(2016, 7, 21)})
Semester.create!({name: 'Fall 2016', deposit: 50, rent: 1445, start_date: Date.new(2016, 9, 10), end_date: Date.new(2016, 12, 13)})

Apartment.create!({title: '106', description: '102 desc', image_id: 'none', building_id: 1})
Apartment.create!({title: '202', description: '202 desc', image_id: 'none', building_id: 1})
Apartment.create!({title: '302', description: '302 desc', image_id: 'none', building_id: 1})
Apartment.create!({title: '404', description: '402 desc', image_id: 'none', building_id: 1})
Apartment.create!({title: '102', description: '102 desc', image_id: 'none', building_id: 2})
Apartment.create!({title: '202', description: '202 desc', image_id: 'none', building_id: 2})
Apartment.create!({title: '302', description: '302 desc', image_id: 'none', building_id: 2})
Apartment.create!({title: '402', description: '402 desc', image_id: 'none', building_id: 2})
apt403 = Apartment.create!({title: '403', description: '403 desc', image_id: 'none', building_id: 2})

#  bldg 1
# apt 106
Bed.create!({letter: 'a', apartment_id: 1, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'b', apartment_id: 1, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'c', apartment_id: 1, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'd', apartment_id: 1, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'e', apartment_id: 1, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'f', apartment_id: 1, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 202
Bed.create!({letter: 'a', apartment_id: 2, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'b', apartment_id: 2, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'c', apartment_id: 2, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'd', apartment_id: 2, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'e', apartment_id: 2, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'f', apartment_id: 2, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'g', apartment_id: 2, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'h', apartment_id: 2, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 302
Bed.create!({letter: 'a', apartment_id: 3, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'b', apartment_id: 3, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'c', apartment_id: 3, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'd', apartment_id: 3, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'e', apartment_id: 3, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'f', apartment_id: 3, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'g', apartment_id: 3, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'h', apartment_id: 3, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 404
Bed.create!({letter: 'a', apartment_id: 4, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'b', apartment_id: 4, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'c', apartment_id: 4, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'd', apartment_id: 4, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# bldg 2
# apt 102
Bed.create!({letter: 'a', apartment_id: 5, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'b', apartment_id: 5, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'c', apartment_id: 5, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'd', apartment_id: 5, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'e', apartment_id: 5, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'f', apartment_id: 5, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 202
Bed.create!({letter: 'a', apartment_id: 6, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'b', apartment_id: 6, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'c', apartment_id: 6, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'd', apartment_id: 6, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'e', apartment_id: 6, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'f', apartment_id: 6, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 302
Bed.create!({letter: 'a', apartment_id: 7, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'b', apartment_id: 7, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'c', apartment_id: 7, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'd', apartment_id: 7, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'e', apartment_id: 7, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'f', apartment_id: 7, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 402
bed1 = Bed.create!({letter: 'a', apartment_id: 8, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
bed2 = Bed.create!({letter: 'b', apartment_id: 8, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
bed3 = Bed.create!({letter: 'c', apartment_id: 8, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
bed4 = Bed.create!({letter: 'd', apartment_id: 8, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
bed5 = Bed.create!({letter: 'e', apartment_id: 8, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
bed6 = Bed.create!({letter: 'f', apartment_id: 8, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})

Bed.create!({letter: 'a', apartment: apt403, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'b', apartment: apt403, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'c', apartment: apt403, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'd', apartment: apt403, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'e', apartment: apt403, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
Bed.create!({letter: 'f', apartment: apt403, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})

[bed1, bed2, bed3, bed4, bed5, bed6].each do |bed|
	Contract.create!({semesters: [sem2], 
	  first_name: "Evan", 
	  last_name: "Caldwell", 
	  email: "cal98022@byui.edu", 
	  home_address_1: "123 fake st.", 
	  home_city: "Rexburg",
	  home_state: "ID",
	  home_zip: "83440",
	  parking_type: "Tandem Uncovered",
	  phone: "801-753-8260",
	  apartment_type: "6 Person",
	  eligibility_sig: "Evan Caldwell",
	  living_standards_sig: "Evan Caldwell",
	  parking_ack: "Evan Caldwell",
	  contract_agreement: "Evan Caldwell",
	  bed: bed})
end

[bed1, bed2, bed3].each do |bed|
	Contract.create!({semesters: [sem1], 
	  first_name: "Evan", 
	  last_name: "Caldwell", 
	  email: "cal98022@byui.edu", 
	  home_address_1: "123 fake st.", 
	  home_city: "Rexburg",
	  home_state: "ID",
	  home_zip: "83440",
	  parking_type: "Tandem Uncovered",
	  phone: "801-753-8260",
	  apartment_type: "6 Person",
	  eligibility_sig: "Evan Caldwell",
	  living_standards_sig: "Evan Caldwell",
	  parking_ack: "Evan Caldwell",
	  contract_agreement: "Evan Caldwell",
	  bed: bed})
end

Admin.create({email: 'managers@windsormanor.net', password: 'Greatestplace1'})
