class AddEuroToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :euro, :string
  end
end
