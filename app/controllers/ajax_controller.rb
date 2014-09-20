class AjaxController < ApplicationController
	def apartments
		@building = Building.find(params[:building_id])
	end
end
