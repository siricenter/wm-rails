module Prices
	def self.parking_price type, semesters
		count = semesters.count
		if type == 'Private Covered'
      parking_array = Array.new(count, 75)
      parking_array[0] = 100
      parking_array[1] = 85
      return parking_array
#	#		return [ 100 ] if count == 1
	#		return [ 100, 85 ] if count == 2
	#		return [ 100, 85, 75 ]
		elsif type == 'Tandem Covered'
      parking_array = Array.new(count, 60)
      parking_array[0] = 75
      parking_array[1] = 65
      return parking_array
	#		return [ 75 ] if count == 1
	#		return [ 75, 65 ] if count == 2
	#		return [ 75, 65, 60 ]
		elsif type == 'Private Uncovered'
      parking_array = Array.new(count, 35)
      parking_array[0] = 50
      parking_array[1] = 40
      return parking_array
	#		return [ 50 ] if count == 1
	#		return [ 50, 40 ] if count == 2
	#		return [ 50, 40, 35 ]
		elsif type == 'Tandem Uncovered'
      parking_array = Array.new(count, 25)
      parking_array[0] = 35
      parking_array[1] = 30
      return parking_array
	#		return [ 35 ] if count == 1
	#		return [ 35, 30 ] if count == 2
	#		return [ 35, 30, 25 ]
		else
      return Array.new(count, 0)
	#		return [ 0 ] if count == 1
	#		return [ 0, 0 ] if count == 2
	#		return [ 0, 0, 0 ]
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
    mult_sem_array = Array.new(semesters.count, 105)
    mult_sem_array[0] = 0
    mult_sem_array[1] = 95
    return mult_sem_array
	end

	def self.early_bird semesters, today
		days = (semesters.first.start_date - today).to_i
    if days < 60
      return Array.new(semesters.count, 0)
    else
      early_bird_array = Array.new(semesters.count, 10)
      early_bird_array[0] = 40 if days >= 90
      early_bird_array[0] = 20 if days >= 60
      return early_bird_array
    end
	end  
end
