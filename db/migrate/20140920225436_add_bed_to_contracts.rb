class AddBedToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :bed, index: true
  end
end
