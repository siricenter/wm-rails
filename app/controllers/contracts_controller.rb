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
		@semester = @contract.semester
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
		respond_to do |format|
			@semester = Semester.find(params[:contract][:semester])
			@building = @contract.building
			@contract.semester = @semester
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
		if params.has_key? :contract
			@contract = Contract.new(contract_params)
			@semester = Semester.find(params[:contract][:semester])
			@building = Building.find(params[:building_id])
			@contract.semester = @semester
			@contract.building = @building
		else
			@contract = Contract.new(JSON.parse(session[:temp_contract]))
			@semester = Semester.find(session[:semester_id])
			@building = Building.find(session[:building_id])
			@contract.semester = @semester
			@contract.building = @building
		end


		session[:temp_contract] = @contract.to_json
		session[:semester_id] = @semester.id
		session[:building_id] = @building.id

		set_prices

		respond_to do |format|
			if @contract.valid?
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
		if session[:temp_contract] and session[:semester_id] and session[:building_id]
			@contract = Contract.new(JSON.parse(session[:temp_contract]))
			@semester = Semester.find(session[:semester_id])
			@building = Building.find(session[:building_id])
			@contract.semester = @semester
			@contract.building = @building
			set_prices

			respond_to do |format|
				unless session[:reserved]
					if @contract.save
						session[:reserved] = true
						format.html {render :success}
					else
						format.html {render :failure}
					end
				else
					format.html {render :success}
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
		params.require(:contract).permit(:first_name, :last_name, :email, :home_address_1, :home_address_2, :home_city, :home_state, :home_zip, :room_type, :parking_type, :phone, :apartment_type, :eligibility_sig, :living_standards_sig, :parking_ack, :euro, :contract_agreement, :preferences, :number)
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

	def setup_form url, method, contract = nil
		@semesters = Semester.all
		@url = url
		@method = method
		if contract
			@contract = contract
			@building = @contract.building
			@semester = @contract.semester
		end

		@contract ||= Contract.new
		@building ||= Building.find(params[:building_id])
		@contract.building ||= @building
		if params[:semester_id]
			@semester ||= Semester.find(params[:semester_id]) 
			@contract.semester = @semester
		else
			@semester ||= @semesters.first
			@contract.semester = @semester
		end
	end
end
