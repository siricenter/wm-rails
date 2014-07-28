class AddSignaturesToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :eligibility_sig, :string
    add_column :contracts, :living_standards_sig, :string
    add_column :contracts, :parking_ack, :string
  end
end
