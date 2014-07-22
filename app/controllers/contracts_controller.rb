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
		@apartments = Apartment.where(building: @building)

		session[:building_id] = @building.id
	end

	# GET /contracts/1/edit
	def edit
	end

	# POST /contracts
	# POST /contracts.json
	def create
		@contract = Contract.new(contract_params)
		@semester = Semester.find(params[:contract][:semester])
		@apartment = Apartment.find(params[:contract][:apartment])


		@contract.semester = @semester
		@contract.apartment = @apartment

		respond_to do |format|
			if @contract.save
				format.html { redirect_to :root, notice: 'Contract was successfully created.' }
				format.json { render :show, status: :created, location: @contract }
			else
				format.html { 
					@building = @apartment.building
					@apartments = @building.apartments
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
			@apartment = Apartment.find(params[:contract][:apartment])
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

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_contract
		@contract = Contract.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def contract_params
		params.require(:contract).permit(:first_name, :last_name, :email, :home_address_1, :home_address_2, :home_city, :home_state, :home_zip, :room_type, :parking_type)
	end
end
