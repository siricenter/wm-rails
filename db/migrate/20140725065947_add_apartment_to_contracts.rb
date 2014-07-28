class AddApartmentToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :apartment_type, :string
  end
end
