class AjaxController < ApplicationController
	respond_to :json

	def beds
		@apartments = Apartment.where(building_id: params[:building_id])
		@semester = Semester.find(params[:semester_id])
		render 'ajax/beds', formats: [:json]
	end
end
