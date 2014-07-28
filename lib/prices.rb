module Prices
	def self.parking_price type, duration
		if type == 'Private Covered'
			return 100 if duration == 1
			return 185 if duration == 2
			return 270
		elsif type == 'Tandem Covered'
			return 75 if duration == 1
			return 140 if duration == 2
			return 200
		elsif type == 'Private Uncovered'
			return 50 if duration == 1
			return 90 if duration == 2
			return 125
		elsif type == 'Tandem Uncovered'
			return 35 if duration == 1
			return 65 if duration == 2
			return 90
		else
			return 0
		end
	end

	def self.application_fee
		return 50
	end

	def self.deposit semester
		return semester.deposit
	end

	def self.rent semester
		return semester.rent
	end

	def self.multiple_semester_discounts semester
		return [0] if semester.duration == 1
		return [0, 95] if semester.duration == 2
		return [0, 95, 105] if semester.duration == 3
	end

	def self.early_bird semester, today
		days = (semester.start_date - today).to_i
		if semester.duration == 1
			return [ 40 ] if days >= 90
			return [ 20 ] if days >= 60
			return [ 0 ]
		elsif semester.duration == 2
			return [40, 10] if days >= 90
			return [20, 10] if days >= 60
			return [0, 0]
		elsif semester.duration == 3
			return [40, 10, 10] if days >= 90
			return [20, 10, 10] if days >= 60
			return [0, 0, 0]
		else
			return [0, 0, 0]
		end
	end
end
