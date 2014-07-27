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
end
