module Prices
	def self.parking_price type, semesters
		count = semesters.count
		if type == 'Private Covered'
			return [ 100 ] if count == 1
			return [ 100, 85 ] if count == 2
			return [ 100, 85, 75 ]
		elsif type == 'Tandem Covered'
			return [ 75 ] if count == 1
			return [ 75, 65 ] if count == 2
			return [ 75, 65, 60 ]
		elsif type == 'Private Uncovered'
			return [ 50 ] if count == 1
			return [ 50, 40 ] if count == 2
			return [ 50, 40, 35 ]
		elsif type == 'Tandem Uncovered'
			return [ 35 ] if count == 1
			return [ 35, 30 ] if count == 2
			return [ 35, 30, 25 ]
		else
			return [ 0 ] if count == 1
			return [ 0, 0 ] if count == 2
			return [ 0, 0, 0 ]
		end
	end

	def self.application_fee
		return 50
	end

	def self.deposit semesters
		return semesters.first.deposit
	end

	def self.rent semesters
		return semesters.first.rent
	end

	def self.multiple_semester_discounts semesters
		return [0] if semesters.count == 1
		return [0, 95] if semesters.count == 2
		return [0, 95, 105] if semesters.count == 3
	end

	def self.early_bird semesters, today
		days = (semesters.first.start_date - today).to_i
		if semesters.count == 1
			return [ 40 ] if days >= 90
			return [ 20 ] if days >= 60
			return [ 0 ]
		elsif semesters.count == 2
			return [40, 10] if days >= 90
			return [20, 10] if days >= 60
			return [0, 0]
		elsif semesters.count == 3
			return [40, 10, 10] if days >= 90
			return [20, 10, 10] if days >= 60
			return [0, 0, 0]
		else
			return [0, 0, 0]
		end
	end
end
