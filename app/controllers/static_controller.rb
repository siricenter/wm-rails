class StaticController < ApplicationController
	before_action :authenticate_admin!, only: ['dashboard', 'marketing_text']
	before_action :availability

	def choose
		buildings = Building.all
		@mens = buildings.first
		@womens = buildings.last
	end

	def dashboard
		
	end

	def marketing_text
		@marketing_text = MarketingText.first
		@marketing_text ||= MarketingText.new
	end

	def edit_text
		text = params[:marketing_text]
		@marketing_text = MarketingText.first
		@marketing_text ||= MarketingText.new
		@marketing_text.text = text
		@marketing_text.save
		redirect_to root_path
	end

	def amenities
		@amenities = Amenity.all
	end

	def galleries
		@galleries = Gallery.all
	end    

	def apartments
		@apartments = Apartment.all
	end    
	
	def contact_manager
		
	end
	
	def manager_email
		@email = params[:email]
		ContactManager.contact_email(@email).deliver
		respond_to do |format|
		format.html { redirect_to tenant_path, notice: 'Email was successfully sent.' }
		end
	end

	private
	def availability
		@marketing_text = MarketingText.first
		@marketing_text = @marketing_text.text if @marketing_text
		@marketing_text ||= ""
		@semesters = Semester.where('start_date >= ?', Date.today - 30).order(:start_date).limit(6)
	end
end
