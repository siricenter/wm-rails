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
	end

	# GET /contracts/new
	def new
		@contract = Contract.new
		@semesters = Semester.all
		@building = Building.find(params[:building_id])
	end

	# GET /contracts/1/edit
	def edit
	end

	# POST /contracts
	# POST /contracts.json
	def create
		@contract = Contract.new(contract_params)
		@semester = Semester.find(params[:contract][:semester])
		@building = Building.find(params[:contract][:building_id])


		@contract.semester = @semester
		@contract.building = @building

		respond_to do |format|
			if @contract.save
				format.html { redirect_to :root, notice: 'Contract was successfully created.' }
				format.json { render :show, status: :created, location: @contract }
			else
				format.html { 
					@semesters = Semester.all
					render :new 
				}
				format.json { render json: @contract.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /contracts/1
	# PATCH/PUT /contracts/1.json
	def update
		respond_to do |format|
			@semester = Semester.find(params[:contract][:semester])
			@building = Building.find(params[:contract][:building_id])
			if @contract.update(contract_params)
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
		@contract = Contract.new(contract_params)
		@semester = Semester.find(params[:contract][:semester])
		@building = Building.find(params[:building_id])
		@contract.semester = @semester
		@contract.building = @building


		session[:temp_contract] = @contract.to_json
		session[:semester_id] = @semester.id
		session[:building_id] = @building.id

		set_prices

		respond_to do |format|
			if @contract.valid?
				format.html 
			else
				format.html {
					@contract = @contract
					@semesters = Semester.all
					render :new
				}
			end
		end
	end

	def success
		if session[:temp_contract] and session[:semester_id] and session[:building_id]
			@contract = Contract.new(JSON.parse(session[:temp_contract]))
			@semester = Semester.find(session[:semester_id])
			@building = Building.find(session[:building_id])
			@contract.semester = @semester
			@contract.building = @building

			set_prices

			session[:temp_contract] = nil
			session[:semester_id] = nil
			session[:building_id] = nil

			respond_to do |format|
				if @contract.save
					format.html {render :success}
				else
					format.html {render :failure}
				end
			end
		else
			redirect_to root_url
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_contract
		@contract = Contract.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def contract_params
		params.require(:contract).permit(:first_name, :last_name, :email, :home_address_1, :home_address_2, :home_city, :home_state, :home_zip, :room_type, :parking_type, :phone, :apartment_type, :eligibility_sig, :living_standards_sig, :parking_ack, :euro, :contract_agreement)
	end

	def set_prices
		# Prices
		@application_fee = Prices::application_fee
		@deposit = Prices::deposit(@semester)
		@rent = Prices::rent(@semester)
		@parking = Prices::parking_price(@contract.parking_type, @semester)
		@early_bird = Prices::early_bird(@semester, Date.today)
		@multiple_semesters = Prices::multiple_semester_discounts @semester

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

		@total = @application_fee + @deposit + @rent * @semester.duration + @parking_price - @discounts_total
	end
end
