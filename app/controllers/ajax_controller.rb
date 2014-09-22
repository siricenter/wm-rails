class AjaxController < ApplicationController
	def beds
		@building = Building.find(params[:building_id])
	end
end
