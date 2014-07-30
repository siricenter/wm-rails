class AddFieldsToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :preferences, :text
    add_column :contracts, :number, :text
  end
end
