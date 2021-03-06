module Prices
	def self.parking_price type, semesters
		count = semesters.count
		if type == 'Private Covered'
			parking_array = Array.new(count, 75)
			parking_array[0] = 100
			parking_array[1] = 85 if count > 1
			return parking_array
		elsif type == 'Tandem Covered'
			parking_array = Array.new(count, 60)
			parking_array[0] = 75
			parking_array[1] = 65 if count > 1
			return parking_array
		elsif type == 'Private Uncovered'
			parking_array = Array.new(count, 35)
			parking_array[0] = 50
			parking_array[1] = 40 if count > 1
			return parking_array
		elsif type == 'Tandem Uncovered'
			parking_array = Array.new(count, 25)
			parking_array[0] = 35
			parking_array[1] = 30 if count > 1
			return parking_array
		else
			return Array.new(count, 0)
		end
	end

	def self.application_fee
		return 50
	end

	def self.deposit semesters
		return semesters.first.deposit
	end

	def self.rent semesters
		return semesters.map do |semester|
			semester.rent
		end
	end

	def self.multiple_semester_discounts semesters
		mult_sem_array = Array.new(semesters.count, 105)
		mult_sem_array[0] = 0
		mult_sem_array[1] = 95 if semesters.count > 1
		return mult_sem_array
	end

	def self.early_bird semesters, today
		days = (semesters.first.start_date)
		array = nil

		if days < 60
			array = Array.new(semesters.count, 0)
		else
			array = Array.new(semesters.count, 10)

			if days >= 90
				array[0] = 40
			else
				array[0] = 20
			end
		end

		return array
	end  
end
