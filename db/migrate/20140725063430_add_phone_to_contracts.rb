class AddPhoneToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :phone, :string
  end
end
