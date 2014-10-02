class LandingController < ApplicationController
	def landing
		@marketing_text = MarketingText.first
		@marketing_text = @marketing_text.text if @marketing_text
		@marketing_text ||= ""
		@semesters = Semester.where('start_date >= ?', Date.today - 30).order(:start_date).limit(6)
	end
end
