class AddBuildingIdToApartments < ActiveRecord::Migration
  def change
    add_reference :apartments, :building, index: true
  end
end
