class ContractsController < ApplicationController
	before_action :authenticate_admin!, only: [:index, :show, :edit, :update]
	before_action :set_contract, only: [:show, :edit, :update, :destroy]

	# GET /contracts
	# GET /contracts.json
	def index
		@contracts = Contract.all
	end

	# GET /contracts/1
	# GET /contracts/1.json
	def show
		@semesters = @contract.semesters
		set_prices
	end

	# GET /contracts/new
	def new
		setup_form discounts_path, :post
	end

	# GET /contracts/1/edit
	def edit
		setup_form @contract, :put, Contract.find(params[:id])
	end

	# POST /contracts
	# POST /contracts.json
	def create
		@contract = Contract.new(contract_params)
		@semesters = Semester.find(params[:contract][:semesters])
		@building = Building.find(params[:contract][:building_id])


		@semesters.each do |semester|
			@contract.semesters << semester
		end

		@contract.building = @building

		respond_to do |format|
			if @contract.save
				format.html { redirect_to :root, notice: 'Contract was successfully created.' }
				format.json { render :show, status: :created, location: @contract }
			else
				format.html { 
					setup_form discounts_path, @method, @contract
					render :new 
				}
				format.json { render json: @contract.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /contracts/1
	# PATCH/PUT /contracts/1.json
	def update
		# set_contract is called prior to this method
		#render inline: params.inspect

		@semesters = Semester.find(params[:contract][:semesters])
		@old_semesters = @contract.semesters
		@building = @contract.building
		@contract.semesters = @semesters

		respond_to do |format|
			if @contract.attributes = contract_params and @contract.save
				format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
				format.json { render :show, status: :ok, location: @contract }
			else
				format.html { render :edit }
				format.json { render json: @contract.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /contracts/1
	# DELETE /contracts/1.json
	def destroy
		@contract.destroy
		respond_to do |format|
			format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def discounts
		# Model Retrieval
		# If data is from the form
		#render inline: params.inspect
		if params[:contract][:semesters].present?
			@semesters = Semester.find(params[:contract][:semesters])
		else
			@semesters = []
		end
		@contract = Contract.new(contract_params)
		@building = Building.find(params[:building_id])
		@semesters.each do |semester|
			@contract.semesters << semester
		end
		@contract.building = @building


		session[:temp_contract] = @contract.to_json
		session[:semesters] = @semesters.map do |semester|
			semester.id
		end.to_json
		session[:building_id] = @building.id

		respond_to do |format|
			if @contract.valid?
				set_prices
				format.html 
			else
				format.html {
					setup_form discounts_path, :post, @contract
					render :new
				}
			end
		end
	end

	def success
		@contract = Contract.new(JSON.parse(session[:temp_contract]))
		@semesters = []

		JSON.parse(session[:semesters]).each do |semester_id|
			semester = Semester.find(semester_id)
			@semesters << semester
			@contract.semesters << semester
		end

		@semesters = @semesters.sort{|a, b| a.start_date <=> b.start_date}

		@building = Building.find(session[:building_id])

		@contract.building = @building

		set_prices

		#render inline: @contract.save.to_s

		respond_to do |format|
			if @contract.save!
				ContractNotification.contract_saved(@contract).deliver
				format.html {render :success}
			else
				format.html {render :failure}
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_contract
		@contract = Contract.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def contract_params
		params.require(:contract).permit(:first_name, :last_name, :email, :home_address_1, :home_address_2, :home_city, :home_state, :home_zip, :room_type, :parking_type, :phone, :apartment_type, :eligibility_sig, :living_standards_sig, :parking_ack, :euro, :contract_agreement, :preferences, :number, :semesters)
	end

	def set_prices
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
	end

	def setup_form url, method, contract = nil
		@semesters = Semester.where('start_date >= ?', Date.today - 30).order(:start_date).limit(6)
		@url = url
		@method = method
		if contract 
			@contract = contract
			@building = @contract.building
			@selected_semesters = @contract.semesters
			@semesters.concat(@contract.semesters).uniq
		end

		@contract ||= Contract.new
		@building ||= Building.find(params[:building_id])
		@contract.building ||= @building
		@selected_semesters ||= []
	end
end
