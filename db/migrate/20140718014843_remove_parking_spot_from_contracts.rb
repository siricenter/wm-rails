class RemoveParkingSpotFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :parking_spot_id, :reference
  end
end
