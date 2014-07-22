class StaticController < ApplicationController
  def landing
	  @semesters = Semester.all
  end

  def choose
	  buildings = Building.all
	  @mens = buildings.first
	  @womens = buildings.last
  end
end
