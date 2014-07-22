class StaticController < ApplicationController
	layout 'landing', except: [:choose]

	def landing
		@semesters = Semester.all
	end

	def choose
		buildings = Building.all
		@mens = buildings.first
		@womens = buildings.last
	end
end
