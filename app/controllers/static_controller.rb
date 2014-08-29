class StaticController < ApplicationController
	layout 'landing', except: [:choose]
	before_action :authenticate_admin!, only: ['dashboard', 'marketing_text']

	def landing
		@marketing_text = MarketingText.first
		@marketing_text = @marketing_text.text if @marketing_text
		@marketing_text ||= ""
		@semesters = Semester.where('start_date >= ?', Date.today - 30).order(:start_date).limit(6)
	end

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
end
