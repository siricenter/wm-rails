class StaticController < ApplicationController
  def landing
  end

  def choose
	  buildings = Building.all
	  @mens = buildings.first
	  @womens = buildings.last
  end
end
