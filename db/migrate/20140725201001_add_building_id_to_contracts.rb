class AddBuildingIdToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :building, index: true
  end
end
