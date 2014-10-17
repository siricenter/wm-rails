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
mensBldg = Building.create!({name: 'Windsor Manor Men\'s', capacity: 206})
wmensBldg = Building.create!({name: 'Windsor Manor Women\'s', capacity: 344})

sem1 = Semester.create!({name: 'Winter 2015', deposit: 50, rent: 1445, start_date: Date.new(2015, 1, 1), end_date: Date.new(2015, 4, 12)})
sem2 = Semester.create!({name: 'Spring 2015', deposit: 50, rent: 1445, start_date: Date.new(2015, 4, 15), end_date: Date.new(2015, 7, 21)})
sem3 = Semester.create!({name: 'Fall 2015', deposit: 50, rent: 1445, start_date: Date.new(2015, 9, 10), end_date: Date.new(2015, 12, 13)})
sem4 = Semester.create!({name: 'Winter 2016', deposit: 50, rent: 1445, start_date: Date.new(2016, 1, 1), end_date: Date.new(2016, 1, 31)})
sem5 = Semester.create!({name: 'Spring 2016', deposit: 50, rent: 1445, start_date: Date.new(2016, 4, 15), end_date: Date.new(2016, 7, 21)})
sem6 = Semester.create!({name: 'Fall 2016', deposit: 50, rent: 1445, start_date: Date.new(2016, 9, 10), end_date: Date.new(2016, 12, 13)})

mapt102 = Apartment.create!({title: '102', description: '102 desc', image_id: 'none', building_id: mensBldg.id})
mapt202 = Apartment.create!({title: '202', description: '202 desc', image_id: 'none', building_id: mensBldg.id})
mapt302 = Apartment.create!({title: '302', description: '302 desc', image_id: 'none', building_id: mensBldg.id})
mapt402 = Apartment.create!({title: '402', description: '402 desc', image_id: 'none', building_id: mensBldg.id})
mapt403 = Apartment.create!({title: '403', description: '403 desc', image_id: 'none', building_id: mensBldg.id})
mapt404 = Apartment.create!({title: '404', description: '404 desc', image_id: 'none', building_id: mensBldg.id})
mapt406 = Apartment.create!({title: '406', description: '406 desc', image_id: 'none', building_id: mensBldg.id})
mapt407 = Apartment.create!({title: '407', description: '407 desc', image_id: 'none', building_id: mensBldg.id})
mapt408 = Apartment.create!({title: '408', description: '408 desc', image_id: 'none', building_id: mensBldg.id})
mapt409 = Apartment.create!({title: '409', description: '409 desc', image_id: 'none', building_id: mensBldg.id})
mapt410 = Apartment.create!({title: '410', description: '410 desc', image_id: 'none', building_id: mensBldg.id})
wapt106 = Apartment.create!({title: '106', description: '106 desc', image_id: 'none', building_id: wmensBldg.id})
wapt202 = Apartment.create!({title: '202', description: '202 desc', image_id: 'none', building_id: wmensBldg.id})
wapt302 = Apartment.create!({title: '302', description: '302 desc', image_id: 'none', building_id: wmensBldg.id})
wapt402 = Apartment.create!({title: '402', description: '402 desc', image_id: 'none', building_id: wmensBldg.id})
wapt403 = Apartment.create!({title: '403', description: '403 desc', image_id: 'none', building_id: wmensBldg.id})
wapt404 = Apartment.create!({title: '404', description: '404 desc', image_id: 'none', building_id: wmensBldg.id})
wapt406 = Apartment.create!({title: '406', description: '406 desc', image_id: 'none', building_id: wmensBldg.id})
wapt407 = Apartment.create!({title: '407', description: '407 desc', image_id: 'none', building_id: wmensBldg.id})
wapt408 = Apartment.create!({title: '408', description: '408 desc', image_id: 'none', building_id: wmensBldg.id})
wapt409 = Apartment.create!({title: '409', description: '409 desc', image_id: 'none', building_id: wmensBldg.id})

# mens
# apt 102
m102a = Bed.create!({letter: 'a', apartment_id: mapt102.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m102b = Bed.create!({letter: 'b', apartment_id: mapt102.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m102c = Bed.create!({letter: 'c', apartment_id: mapt102.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m102d = Bed.create!({letter: 'd', apartment_id: mapt102.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m102e = Bed.create!({letter: 'e', apartment_id: mapt102.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m102f = Bed.create!({letter: 'f', apartment_id: mapt102.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 202
m202a = Bed.create!({letter: 'a', apartment_id: mapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m202b = Bed.create!({letter: 'b', apartment_id: mapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m202c = Bed.create!({letter: 'c', apartment_id: mapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m202d = Bed.create!({letter: 'd', apartment_id: mapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m202e = Bed.create!({letter: 'e', apartment_id: mapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m202f = Bed.create!({letter: 'f', apartment_id: mapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 302
m302a = Bed.create!({letter: 'a', apartment_id: mapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m302b = Bed.create!({letter: 'b', apartment_id: mapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m302c = Bed.create!({letter: 'c', apartment_id: mapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m302d = Bed.create!({letter: 'd', apartment_id: mapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m302e = Bed.create!({letter: 'e', apartment_id: mapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m302f = Bed.create!({letter: 'f', apartment_id: mapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 402
m402a = Bed.create!({letter: 'a', apartment_id: mapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m402b = Bed.create!({letter: 'b', apartment_id: mapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m402c = Bed.create!({letter: 'c', apartment_id: mapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m402d = Bed.create!({letter: 'd', apartment_id: mapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m402e = Bed.create!({letter: 'e', apartment_id: mapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m402f = Bed.create!({letter: 'f', apartment_id: mapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 403
m403a = Bed.create!({letter: 'a', apartment_id: mapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403b = Bed.create!({letter: 'b', apartment_id: mapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403c = Bed.create!({letter: 'c', apartment_id: mapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403d = Bed.create!({letter: 'd', apartment_id: mapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403e = Bed.create!({letter: 'e', apartment_id: mapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403f = Bed.create!({letter: 'f', apartment_id: mapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403g = Bed.create!({letter: 'g', apartment_id: mapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403h = Bed.create!({letter: 'h', apartment_id: mapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 404
m404a = Bed.create!({letter: 'a', apartment_id: mapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m404b = Bed.create!({letter: 'b', apartment_id: mapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m404c = Bed.create!({letter: 'c', apartment_id: mapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m404d = Bed.create!({letter: 'd', apartment_id: mapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m404e = Bed.create!({letter: 'e', apartment_id: mapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m404f = Bed.create!({letter: 'f', apartment_id: mapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 406
m406a = Bed.create!({letter: 'a', apartment_id: mapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m406b = Bed.create!({letter: 'b', apartment_id: mapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m406c = Bed.create!({letter: 'c', apartment_id: mapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m406d = Bed.create!({letter: 'd', apartment_id: mapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m406e = Bed.create!({letter: 'e', apartment_id: mapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m406f = Bed.create!({letter: 'f', apartment_id: mapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 407
m407a = Bed.create!({letter: 'a', apartment_id: mapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m407b = Bed.create!({letter: 'b', apartment_id: mapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m407c = Bed.create!({letter: 'c', apartment_id: mapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m407d = Bed.create!({letter: 'd', apartment_id: mapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m407e = Bed.create!({letter: 'e', apartment_id: mapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m407f = Bed.create!({letter: 'f', apartment_id: mapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 408
m408a = Bed.create!({letter: 'a', apartment_id: mapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m408b = Bed.create!({letter: 'b', apartment_id: mapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m408c = Bed.create!({letter: 'c', apartment_id: mapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m408d = Bed.create!({letter: 'd', apartment_id: mapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m408e = Bed.create!({letter: 'e', apartment_id: mapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m408f = Bed.create!({letter: 'f', apartment_id: mapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 409
m409a = Bed.create!({letter: 'a', apartment_id: mapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m409b = Bed.create!({letter: 'b', apartment_id: mapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m409c = Bed.create!({letter: 'c', apartment_id: mapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m409d = Bed.create!({letter: 'd', apartment_id: mapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m409e = Bed.create!({letter: 'e', apartment_id: mapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m409f = Bed.create!({letter: 'f', apartment_id: mapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 410
m410a = Bed.create!({letter: 'a', apartment_id: mapt410.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m410b = Bed.create!({letter: 'b', apartment_id: mapt410.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m410c = Bed.create!({letter: 'c', apartment_id: mapt410.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m410d = Bed.create!({letter: 'd', apartment_id: mapt410.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m410e = Bed.create!({letter: 'e', apartment_id: mapt410.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m410f = Bed.create!({letter: 'f', apartment_id: mapt410.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403g = Bed.create!({letter: 'g', apartment_id: mapt410.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
m403h = Bed.create!({letter: 'h', apartment_id: mapt410.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})

# women's
# apt 106
w106a = Bed.create!({letter: 'a', apartment_id: wapt106.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w106b = Bed.create!({letter: 'b', apartment_id: wapt106.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w106c = Bed.create!({letter: 'c', apartment_id: wapt106.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w106d = Bed.create!({letter: 'd', apartment_id: wapt106.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w106e = Bed.create!({letter: 'e', apartment_id: wapt106.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w106f = Bed.create!({letter: 'f', apartment_id: wapt106.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 202
w202a = Bed.create!({letter: 'a', apartment_id: wapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w202b = Bed.create!({letter: 'b', apartment_id: wapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w202c = Bed.create!({letter: 'c', apartment_id: wapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w202d = Bed.create!({letter: 'd', apartment_id: wapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w202e = Bed.create!({letter: 'e', apartment_id: wapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w202f = Bed.create!({letter: 'f', apartment_id: wapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w202g = Bed.create!({letter: 'g', apartment_id: wapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w202h = Bed.create!({letter: 'h', apartment_id: wapt202.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 302
w302a = Bed.create!({letter: 'a', apartment_id: wapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w302b = Bed.create!({letter: 'b', apartment_id: wapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w302c = Bed.create!({letter: 'c', apartment_id: wapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w302d = Bed.create!({letter: 'd', apartment_id: wapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w302e = Bed.create!({letter: 'e', apartment_id: wapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w302f = Bed.create!({letter: 'f', apartment_id: wapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w302g = Bed.create!({letter: 'g', apartment_id: wapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w302h = Bed.create!({letter: 'h', apartment_id: wapt302.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 402
w402a = Bed.create!({letter: 'a', apartment_id: wapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w402b = Bed.create!({letter: 'b', apartment_id: wapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w402c = Bed.create!({letter: 'c', apartment_id: wapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w402d = Bed.create!({letter: 'd', apartment_id: wapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w402e = Bed.create!({letter: 'e', apartment_id: wapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w402f = Bed.create!({letter: 'f', apartment_id: wapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w402g = Bed.create!({letter: 'g', apartment_id: wapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w402h = Bed.create!({letter: 'h', apartment_id: wapt402.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 403
w403a = Bed.create!({letter: 'a', apartment_id: wapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w403b = Bed.create!({letter: 'b', apartment_id: wapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w403c = Bed.create!({letter: 'c', apartment_id: wapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w403d = Bed.create!({letter: 'd', apartment_id: wapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w403e = Bed.create!({letter: 'e', apartment_id: wapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w403f = Bed.create!({letter: 'f', apartment_id: wapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w403g = Bed.create!({letter: 'g', apartment_id: wapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w403h = Bed.create!({letter: 'h', apartment_id: wapt403.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 404
w404a = Bed.create!({letter: 'a', apartment_id: wapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w404b = Bed.create!({letter: 'b', apartment_id: wapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w404c = Bed.create!({letter: 'c', apartment_id: wapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w404d = Bed.create!({letter: 'd', apartment_id: wapt404.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 406
w406a = Bed.create!({letter: 'a', apartment_id: wapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w406b = Bed.create!({letter: 'b', apartment_id: wapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w406c = Bed.create!({letter: 'c', apartment_id: wapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w406d = Bed.create!({letter: 'd', apartment_id: wapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w406e = Bed.create!({letter: 'e', apartment_id: wapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w406f = Bed.create!({letter: 'f', apartment_id: wapt406.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 407
w407a = Bed.create!({letter: 'a', apartment_id: wapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w407b = Bed.create!({letter: 'b', apartment_id: wapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w407c = Bed.create!({letter: 'c', apartment_id: wapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w407d = Bed.create!({letter: 'd', apartment_id: wapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w407e = Bed.create!({letter: 'e', apartment_id: wapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w407f = Bed.create!({letter: 'f', apartment_id: wapt407.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 408
w408a = Bed.create!({letter: 'a', apartment_id: wapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w408b = Bed.create!({letter: 'b', apartment_id: wapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w408c = Bed.create!({letter: 'c', apartment_id: wapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w408d = Bed.create!({letter: 'd', apartment_id: wapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w408e = Bed.create!({letter: 'e', apartment_id: wapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w408f = Bed.create!({letter: 'f', apartment_id: wapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w408g = Bed.create!({letter: 'g', apartment_id: wapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w408h = Bed.create!({letter: 'h', apartment_id: wapt408.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
# apt 409
w409a = Bed.create!({letter: 'a', apartment_id: wapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w409b = Bed.create!({letter: 'b', apartment_id: wapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w409c = Bed.create!({letter: 'c', apartment_id: wapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w409d = Bed.create!({letter: 'd', apartment_id: wapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w409e = Bed.create!({letter: 'e', apartment_id: wapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})
w409f = Bed.create!({letter: 'f', apartment_id: wapt409.id, created_at: Date.new(2014, 9, 18), updated_at: Date.new(2014, 9, 18)})

[w106a, w106b, w106c, w106d, w106e, w106f, 
	w402a, w402b, w402c, w402d, w402e, w402f, 
	w403a, 
	w404a, 
	w406a, 
	w407a, 
	w408a,
	w409a, 
	m402a, m402b, m402c, m402d, m402e, m402f, 
	m403a, 
	m404a, 
	m406a, 
	m407a, 
	m408a,
	m409a,
	m410a].each do |bed|
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

[w402a, w402b, w402c, w402d, w402e, w402f,
	w403a,
	m402a, m402b, m402c, m402d, m402e, m402f,
	m403a].each do |bed|
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

Admin.create({email: 'managers@windsormanor.net', password: 'Greatestplace1'})
