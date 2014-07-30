class AddContractSignatureToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :contract_agreement, :string
  end
end
