class AjaxController < ApplicationController
	respond_to :json

	def beds
		@apartments = Apartment.where(building_id: params[:building_id])
		render 'ajax/beds'
	end
end
