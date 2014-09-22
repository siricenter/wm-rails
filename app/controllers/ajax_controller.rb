class AjaxController < ApplicationController
	def beds
		@apartments = Apartment.where(building_id: params[:building_id])
		render 'ajax/beds', formats: [:json]
	end
end
