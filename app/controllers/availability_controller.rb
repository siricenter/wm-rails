class AvailabilityController < ApplicationController
	# GET /building/:id/availability
	def available
		building = Building.find(params[:id])
		semester = Semester.find(params[:semester_id])
		available = building.availabilities? semester
		hash = {available: available}

		respond_to do |format|
			format.json {render json: hash}
		end
	end
end
