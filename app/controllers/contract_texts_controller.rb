class ContractTextsController < ApplicationController
	before_action :authenticate_admin!, except: [:show]
	before_action :set_contract_text, only: [:show, :edit, :update, :destroy]

	# GET /contract_texts
	# GET /contract_texts.json
	def index
		@contract_texts = ContractText.all
	end

	# GET /contract_texts/1
	# GET /contract_texts/1.json
	def show
	end

	# GET /contract_texts/new
	def new
		@contract_text = ContractText.new
	end

	# GET /contract_texts/1/edit
	def edit
	end

	# POST /contract_texts
	# POST /contract_texts.json
	def create
		@contract_text = ContractText.new(contract_text_params)

		respond_to do |format|
			if @contract_text.save
				format.html { redirect_to @contract_text, notice: 'Contract text was successfully created.' }
				format.json { render :show, status: :created, location: @contract_text }
			else
				format.html { render :new }
				format.json { render json: @contract_text.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /contract_texts/1
	# PATCH/PUT /contract_texts/1.json
	def update
		respond_to do |format|
			if @contract_text.update(contract_text_params)
				format.html { redirect_to @contract_text, notice: 'Contract text was successfully updated.' }
				format.json { render :show, status: :ok, location: @contract_text }
			else
				format.html { render :edit }
				format.json { render json: @contract_text.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /contract_texts/1
	# DELETE /contract_texts/1.json
	def destroy
		@contract_text.destroy
		respond_to do |format|
			format.html { redirect_to contract_texts_url, notice: 'Contract text was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_contract_text
		@contract_text = ContractText.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def contract_text_params
		params.require(:contract_text).permit(:contract, :living_standards, :parking_acknowledgement, :eligibility, :addendum)
	end
end
