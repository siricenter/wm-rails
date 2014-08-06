class StaticController < ApplicationController
	layout 'landing', except: [:choose]
	before_action :authenticate_admin!, only: ['dashboard']

	def landing
		@semesters = Semester.all
	end

	def choose
		buildings = Building.all
		@mens = buildings.first
		@womens = buildings.last
	end

	def dashboard
	end
end
