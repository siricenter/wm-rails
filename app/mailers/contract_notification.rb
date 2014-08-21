class ContractNotification < ActionMailer::Base
	default from: "managers@windsormanor.net"

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.contract_notification.contract_saved.subject
	#
	def contract_saved contract
		@contract = contract
		@semesters = @contract.semesters
		# Prices
		@application_fee = Prices::application_fee
		@deposit = Prices::deposit(@semesters)
		@early_bird = Prices::early_bird(@semesters, Date.today)
		@rent = Prices::rent(@semesters)
		@parking = Prices::parking_price(@contract.parking_type, @semesters)
		@multiple_semesters = Prices::multiple_semester_discounts @semesters

		# Calculations
		@parking_price = 0
		@parking.each do |park|
			@parking_price += park
		end
		@early_bird_sum = 0
		@early_bird.each do |early|
			@early_bird_sum += early
		end
		@multiple_semesters_sum = 0
		@multiple_semesters.each do |discount|
			@multiple_semesters_sum += discount
		end

		@euro = 0
		@euro = 50 unless @contract.euro.empty?
		@discounts_total = @early_bird_sum + @multiple_semesters_sum + @euro

		@rent_sum = 0
		@rent.each do |rent|
			@rent_sum += rent
		end
		@total = @application_fee + @deposit + @rent_sum + @parking_price - @discounts_total

		mail to: ['managers@windsormanor.net', @contract.email],
			subject: 'Your Receipt for Windsor Manor'
	end
end
