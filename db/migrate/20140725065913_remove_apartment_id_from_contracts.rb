class RemoveApartmentIdFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :apartment_id, :integer
  end
end
