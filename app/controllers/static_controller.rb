class StaticController < ApplicationController
  def landing
	  buildings = Building.all
	  @mens = buildings.first
	  @womens = buildings.last
  end

  def choose
  end
end
