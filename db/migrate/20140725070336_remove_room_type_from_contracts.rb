class RemoveRoomTypeFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :room_type, :string
  end
end
